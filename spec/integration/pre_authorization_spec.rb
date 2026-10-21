require 'spec_helper'
require 'integration_setup'
require 'securerandom'
require 'webmock/rspec'

require 'integration/util/payments/cancel_payment_request_builder'
require 'integration/util/payments/capture_payment_request_builder'
require 'integration/util/pre_authorization/increment_authorization_request_builder'
require 'integration/util/pre_authorization/update_authorization_additional_data_request_builder'
require 'integration/util/sdk_test_helper'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/domain/increment_authorization_request'
require 'onlinepayments/sdk/domain/update_authorization_additional_data_request'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/validation_exception'
require 'onlinepayments/sdk/factory'

PRE_AUTHORIZATION_NON_EXISTING_PAYMENT_ID = '9999999999_0'.freeze
PRE_AUTHORIZATION_CURRENCY_CODE = 'EUR'.freeze
PRE_AUTHORIZATION_PAYMENT_AMOUNT = 1000
PRE_AUTHORIZATION_INCREMENTED_AMOUNT = 1500

RSpec.describe 'PreAuthorization' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @payments = @merchant.payments
    @pre_authorization = @merchant.pre_authorization

    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'increment_authorization' do

    context 'with pre-authorized payment' do

      it 'returns incremented payment' do
        payment_id = @sdk_helper.create_pre_authorized_mastercard_payment_and_get_id(
          PRE_AUTHORIZATION_PAYMENT_AMOUNT,
          PRE_AUTHORIZATION_CURRENCY_CODE
        )
        request = Integration::Util::PreAuthorization::IncrementAuthorizationRequestBuilder.new
                                                                                           .with_amount(PRE_AUTHORIZATION_INCREMENTED_AMOUNT)
                                                                                           .build

        response = @pre_authorization.increment_authorization(payment_id, request)

        expect(response).not_to be_nil
        expect(response.payment).not_to be_nil
        expect(response.payment.id).not_to be_nil
        expect(response.payment.status).to eq('PENDING_CAPTURE')

        payment = @payments.get_payment(payment_id)

        expect(payment).not_to be_nil
        expect(payment.status).to eq('PENDING_CAPTURE')
        expect(payment.payment_output).not_to be_nil
        expect(payment.payment_output.amount_of_money).not_to be_nil
        expect(payment.payment_output.amount_of_money.amount).to eq(PRE_AUTHORIZATION_INCREMENTED_AMOUNT)
      end

      it 'returns incremented payment when call context is provided' do
        payment_id = @sdk_helper.create_pre_authorized_mastercard_payment_and_get_id(
          PRE_AUTHORIZATION_PAYMENT_AMOUNT,
          PRE_AUTHORIZATION_CURRENCY_CODE
        )
        request = Integration::Util::PreAuthorization::IncrementAuthorizationRequestBuilder.new
                                                                                           .with_amount(PRE_AUTHORIZATION_INCREMENTED_AMOUNT)
                                                                                           .build
        call_context = OnlinePayments::SDK::CallContext.new("test-increment-authorization-#{SecureRandom.uuid}")

        response = @pre_authorization.increment_authorization(payment_id, request, call_context)

        expect(response).not_to be_nil
        expect(response.payment).not_to be_nil
        expect(response.payment.id).not_to be_nil
        expect(response.payment.status).to eq('PENDING_CAPTURE')

        payment = @payments.get_payment(payment_id)

        expect(payment).not_to be_nil
        expect(payment.status).to eq('PENDING_CAPTURE')
        expect(payment.payment_output).not_to be_nil
        expect(payment.payment_output.amount_of_money).not_to be_nil
        expect(payment.payment_output.amount_of_money.amount).to eq(PRE_AUTHORIZATION_INCREMENTED_AMOUNT)
      end

      it 'returns cumulative amount after two increments' do
        payment_id = @sdk_helper.create_pre_authorized_mastercard_payment_and_get_id(
          PRE_AUTHORIZATION_PAYMENT_AMOUNT,
          PRE_AUTHORIZATION_CURRENCY_CODE
        )

        first_response = @pre_authorization.increment_authorization(
          payment_id,
          Integration::Util::PreAuthorization::IncrementAuthorizationRequestBuilder.new.with_amount(1300).build
        )

        expect(first_response).not_to be_nil
        expect(first_response.payment).not_to be_nil

        second_response = @pre_authorization.increment_authorization(
          payment_id,
          Integration::Util::PreAuthorization::IncrementAuthorizationRequestBuilder.new.with_amount(PRE_AUTHORIZATION_INCREMENTED_AMOUNT).build
        )

        expect(second_response).not_to be_nil
        expect(second_response.payment).not_to be_nil

        payment = @payments.get_payment(payment_id)

        expect(payment).not_to be_nil
        expect(payment.status).to eq('PENDING_CAPTURE')
        expect(payment.payment_output).not_to be_nil
        expect(payment.payment_output.amount_of_money).not_to be_nil
        expect(payment.payment_output.amount_of_money.amount).to eq(PRE_AUTHORIZATION_INCREMENTED_AMOUNT)
      end

      it 'returns captured payment when incremented amount is captured' do
        payment_id = @sdk_helper.create_pre_authorized_mastercard_payment_and_get_id(
          PRE_AUTHORIZATION_PAYMENT_AMOUNT,
          PRE_AUTHORIZATION_CURRENCY_CODE
        )

        @pre_authorization.increment_authorization(
          payment_id,
          Integration::Util::PreAuthorization::IncrementAuthorizationRequestBuilder.new.with_amount(PRE_AUTHORIZATION_INCREMENTED_AMOUNT).build
        )

        capture_request = Integration::Util::Payments::CapturePaymentRequestBuilder.new
                                                                                   .with_amount(PRE_AUTHORIZATION_INCREMENTED_AMOUNT)
                                                                                   .with_is_final(true)
                                                                                   .build

        response = @payments.capture_payment(payment_id, capture_request)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.status).to eq('CAPTURE_REQUESTED')
      end
    end

    context 'with invalid payment id' do

      it 'raises ReferenceException with status code 404' do
        exception = nil
        expect {
          @pre_authorization.increment_authorization(
            PRE_AUTHORIZATION_NON_EXISTING_PAYMENT_ID,
            Integration::Util::PreAuthorization::IncrementAuthorizationRequestBuilder.new.build
          )
        }.to raise_error(OnlinePayments::SDK::ReferenceException) { |e| exception = e }

        expect(exception.status_code).to eq(404)
      end
    end

    context 'without amount of money' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_pre_authorized_mastercard_payment_and_get_id(
          PRE_AUTHORIZATION_PAYMENT_AMOUNT,
          PRE_AUTHORIZATION_CURRENCY_CODE
        )

        expect {
          @pre_authorization.increment_authorization(payment_id, OnlinePayments::SDK::Domain::IncrementAuthorizationRequest.new)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with zero amount' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_pre_authorized_mastercard_payment_and_get_id(
          PRE_AUTHORIZATION_PAYMENT_AMOUNT,
          PRE_AUTHORIZATION_CURRENCY_CODE
        )
        request = Integration::Util::PreAuthorization::IncrementAuthorizationRequestBuilder.new
                                                                                           .with_amount(0)
                                                                                           .build

        expect { @pre_authorization.increment_authorization(payment_id, request) }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with different currency' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_pre_authorized_mastercard_payment_and_get_id(
          PRE_AUTHORIZATION_PAYMENT_AMOUNT,
          PRE_AUTHORIZATION_CURRENCY_CODE
        )
        request = Integration::Util::PreAuthorization::IncrementAuthorizationRequestBuilder.new
                                                                                           .with_currency('USD')
                                                                                           .build

        expect { @pre_authorization.increment_authorization(payment_id, request) }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with final authorization payment' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_mastercard_payment_and_get_id(PRE_AUTHORIZATION_PAYMENT_AMOUNT, PRE_AUTHORIZATION_CURRENCY_CODE)
        request = Integration::Util::PreAuthorization::IncrementAuthorizationRequestBuilder.new.build

        expect { @pre_authorization.increment_authorization(payment_id, request) }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'after capture' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_pre_authorized_mastercard_payment_and_get_id(
          PRE_AUTHORIZATION_PAYMENT_AMOUNT,
          PRE_AUTHORIZATION_CURRENCY_CODE
        )

        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)

        expect {
          @pre_authorization.increment_authorization(
            payment_id,
            Integration::Util::PreAuthorization::IncrementAuthorizationRequestBuilder.new.build
          )
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'after cancel' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_pre_authorized_mastercard_payment_and_get_id(
          PRE_AUTHORIZATION_PAYMENT_AMOUNT,
          PRE_AUTHORIZATION_CURRENCY_CODE
        )

        @payments.cancel_payment(payment_id, Integration::Util::Payments::CancelPaymentRequestBuilder.new.build)

        expect {
          @pre_authorization.increment_authorization(
            payment_id,
            Integration::Util::PreAuthorization::IncrementAuthorizationRequestBuilder.new.build
          )
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end

  describe 'add_authorization_details' do

    context 'with pre-authorized payment' do

      it 'returns payment when full car rental data is provided' do
        payment_id = @sdk_helper.create_pre_authorized_payment_and_get_id(PRE_AUTHORIZATION_PAYMENT_AMOUNT, PRE_AUTHORIZATION_CURRENCY_CODE)

        response = @pre_authorization.add_authorization_details(
          payment_id,
          Integration::Util::PreAuthorization::UpdateAuthorizationAdditionalDataRequestBuilder.new.build
        )

        expect(response).not_to be_nil
        expect(response.payment).not_to be_nil
        expect(response.payment.id).not_to be_nil
        expect(response.payment.status).to eq('PENDING_CAPTURE')
      end

      it 'returns payment when minimal car rental data is provided' do
        payment_id = @sdk_helper.create_pre_authorized_payment_and_get_id(PRE_AUTHORIZATION_PAYMENT_AMOUNT, PRE_AUTHORIZATION_CURRENCY_CODE)
        request = Integration::Util::PreAuthorization::UpdateAuthorizationAdditionalDataRequestBuilder.new
                                                                                                      .with_minimal_car_rental_data
                                                                                                      .build

        response = @pre_authorization.add_authorization_details(payment_id, request)

        expect(response).not_to be_nil
        expect(response.payment).not_to be_nil
        expect(response.payment.id).not_to be_nil
        expect(response.payment.status).to eq('PENDING_CAPTURE')
      end

      it 'returns payment when call context is provided' do
        payment_id = @sdk_helper.create_pre_authorized_payment_and_get_id(PRE_AUTHORIZATION_PAYMENT_AMOUNT, PRE_AUTHORIZATION_CURRENCY_CODE)
        call_context = OnlinePayments::SDK::CallContext.new("test-authorization-details-#{SecureRandom.uuid}")

        response = @pre_authorization.add_authorization_details(
          payment_id,
          Integration::Util::PreAuthorization::UpdateAuthorizationAdditionalDataRequestBuilder.new.build,
          call_context
        )

        expect(response).not_to be_nil
        expect(response.payment).not_to be_nil
        expect(response.payment.id).not_to be_nil
        expect(response.payment.status).to eq('PENDING_CAPTURE')
      end

      it 'returns captured payment when captured after adding details' do
        payment_id = @sdk_helper.create_pre_authorized_payment_and_get_id(PRE_AUTHORIZATION_PAYMENT_AMOUNT, PRE_AUTHORIZATION_CURRENCY_CODE)

        @pre_authorization.add_authorization_details(
          payment_id,
          Integration::Util::PreAuthorization::UpdateAuthorizationAdditionalDataRequestBuilder.new.build
        )

        response = @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.status).to eq('CAPTURE_REQUESTED')
      end
    end

    context 'with invalid payment id' do

      it 'raises ReferenceException with status code 404' do
        exception = nil
        expect {
          @pre_authorization.add_authorization_details(
            PRE_AUTHORIZATION_NON_EXISTING_PAYMENT_ID,
            Integration::Util::PreAuthorization::UpdateAuthorizationAdditionalDataRequestBuilder.new.build
          )
        }.to raise_error(OnlinePayments::SDK::ReferenceException) { |e| exception = e }

        expect(exception.status_code).to eq(404)
      end
    end

    context 'without car rental data' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_pre_authorized_payment_and_get_id(PRE_AUTHORIZATION_PAYMENT_AMOUNT, PRE_AUTHORIZATION_CURRENCY_CODE)

        expect {
          @pre_authorization.add_authorization_details(payment_id, OnlinePayments::SDK::Domain::UpdateAuthorizationAdditionalDataRequest.new)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with invalid car rental data' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_pre_authorized_payment_and_get_id(PRE_AUTHORIZATION_PAYMENT_AMOUNT, PRE_AUTHORIZATION_CURRENCY_CODE)
        request = Integration::Util::PreAuthorization::UpdateAuthorizationAdditionalDataRequestBuilder.new
                                                                                                      .with_charges_category('invalid')
                                                                                                      .build

        expect { @pre_authorization.add_authorization_details(payment_id, request) }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'after capture' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_pre_authorized_payment_and_get_id(PRE_AUTHORIZATION_PAYMENT_AMOUNT, PRE_AUTHORIZATION_CURRENCY_CODE)

        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)

        expect {
          @pre_authorization.add_authorization_details(
            payment_id,
            Integration::Util::PreAuthorization::UpdateAuthorizationAdditionalDataRequestBuilder.new.build
          )
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'after cancel' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_pre_authorized_payment_and_get_id(PRE_AUTHORIZATION_PAYMENT_AMOUNT, PRE_AUTHORIZATION_CURRENCY_CODE)

        @payments.cancel_payment(payment_id, Integration::Util::Payments::CancelPaymentRequestBuilder.new.build)

        expect {
          @pre_authorization.add_authorization_details(
            payment_id,
            Integration::Util::PreAuthorization::UpdateAuthorizationAdditionalDataRequestBuilder.new.build
          )
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end
end
