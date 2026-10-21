require 'spec_helper'
require 'integration_setup'
require 'securerandom'
require 'webmock/rspec'

require 'integration/util/common/create_payment_request_builder'
require 'integration/util/payments/cancel_payment_request_builder'
require 'integration/util/payments/capture_payment_request_builder'
require 'integration/util/payments/refund_request_builder'
require 'integration/util/sdk_test_helper'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/declined_payment_exception'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/validation_exception'
require 'onlinepayments/sdk/factory'

NON_EXISTING_PAYMENT_ID = '9999999999_0'.freeze
CURRENCY_CODE = 'EUR'.freeze

RSpec.describe 'Payments' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @payments = @merchant.payments

    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'create_payment' do

    context 'with valid input' do

      it 'returns a created payment' do
        request = Integration::Util::Common::CreatePaymentRequestBuilder.new.build

        response = @payments.create_payment(request)

        expect(response).not_to be_nil
        expect(response.payment).not_to be_nil
        expect(response.payment.id).not_to be_nil
        expect(response.payment.status).not_to be_nil
      end

      it 'returns a created payment when call context is provided' do
        request = Integration::Util::Common::CreatePaymentRequestBuilder.new.build
        context = OnlinePayments::SDK::CallContext.new("test-payments-#{SecureRandom.uuid}")

        response = @payments.create_payment(request, context)

        expect(response).not_to be_nil
        expect(response.payment).not_to be_nil
        expect(response.payment.id).not_to be_nil
        expect(response.payment.status).not_to be_nil
      end
    end

    context 'with invalid card number' do

      it 'raises ValidationException' do
        request = Integration::Util::Common::CreatePaymentRequestBuilder.new
                                                                        .with_card_number('123')
                                                                        .build

        expect { @payments.create_payment(request) }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with auto capture' do

      it 'returns a created payment' do
        request = Integration::Util::Common::CreatePaymentRequestBuilder.new
                                                                        .with_auto_capture(true)
                                                                        .build

        response = @payments.create_payment(request)

        expect(response).not_to be_nil
        expect(response.payment).not_to be_nil
        expect(response.payment.id).not_to be_nil
        expect(response.payment.status).not_to be_nil
      end
    end

    context 'with unsupported card number' do

      it 'raises DeclinedPaymentException' do
        request = Integration::Util::Common::CreatePaymentRequestBuilder.new
                                                                        .with_card_number('4321456998744563')
                                                                        .build

        expect { @payments.create_payment(request) }.to raise_error(OnlinePayments::SDK::DeclinedPaymentException)
      end
    end
  end

  describe 'get_payment' do

    context 'with existing payment id' do

      it 'returns the payment' do
        payment_id = @sdk_helper.create_payment_and_get_id

        response = @payments.get_payment(payment_id)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.id).to eq(payment_id)
        expect(response.status).not_to be_nil
      end

      it 'returns payment details' do
        payment_id = @sdk_helper.create_payment_and_get_id

        response = @payments.get_payment_details(payment_id)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.payment_output).not_to be_nil
        expect(response.status).not_to be_nil
      end
    end

    context 'with invalid payment id' do

      it 'raises ReferenceException when getting payment' do
        expect { @payments.get_payment(NON_EXISTING_PAYMENT_ID) }.to raise_error(OnlinePayments::SDK::ReferenceException)
      end

      it 'raises ReferenceException when getting payment details' do
        expect { @payments.get_payment_details(NON_EXISTING_PAYMENT_ID) }.to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end
  end

  describe 'cancel_payment' do

    context 'with valid request' do

      it 'returns cancelled payment' do
        payment_id = @sdk_helper.create_payment_and_get_id

        cancel_request = Integration::Util::Payments::CancelPaymentRequestBuilder.new.build
        response = @payments.cancel_payment(payment_id, cancel_request)

        expect(response).not_to be_nil
        expect(response.payment).not_to be_nil
        expect(response.payment.id).not_to be_nil
        expect(response.payment.status).not_to be_nil
      end
    end

    context 'with partial amount' do

      it 'returns cancelled payment' do
        payment_id = @sdk_helper.create_payment_and_get_id(800, CURRENCY_CODE)

        request = Integration::Util::Payments::CancelPaymentRequestBuilder.new
                                                                          .with_amount(300)
                                                                          .with_currency(CURRENCY_CODE)
                                                                          .with_is_final(false)
                                                                          .build

        response = @payments.cancel_payment(payment_id, request)

        expect(response).not_to be_nil
        expect(response.payment).not_to be_nil
        expect(response.payment.id).not_to be_nil
        expect(response.payment.status).not_to be_nil
      end

      it 'returns cancelled payment twice when remaining amount is valid' do
        payment_id = @sdk_helper.create_payment_and_get_id(800, CURRENCY_CODE)

        first_cancel_request = Integration::Util::Payments::CancelPaymentRequestBuilder.new
                                                                                       .with_amount(300)
                                                                                       .with_currency(CURRENCY_CODE)
                                                                                       .with_is_final(false)
                                                                                       .build

        first_cancel_response = @payments.cancel_payment(payment_id, first_cancel_request)

        expect(first_cancel_response).not_to be_nil
        expect(first_cancel_response.payment).not_to be_nil
        expect(first_cancel_response.payment.id).not_to be_nil

        second_cancel_request = Integration::Util::Payments::CancelPaymentRequestBuilder.new
                                                                                        .with_amount(500)
                                                                                        .with_currency(CURRENCY_CODE)
                                                                                        .with_is_final(true)
                                                                                        .build

        second_cancel_response = @payments.cancel_payment(payment_id, second_cancel_request)

        expect(second_cancel_response).not_to be_nil
        expect(second_cancel_response.payment).not_to be_nil
        expect(second_cancel_response.payment.id).not_to be_nil
      end

      it 'raises ValidationException when second amount exceeds remaining amount' do
        payment_id = @sdk_helper.create_payment_and_get_id(800, CURRENCY_CODE)

        first_cancel_request = Integration::Util::Payments::CancelPaymentRequestBuilder.new
                                                                                       .with_amount(300)
                                                                                       .with_currency(CURRENCY_CODE)
                                                                                       .with_is_final(false)
                                                                                       .build

        @payments.cancel_payment(payment_id, first_cancel_request)

        second_cancel_request = Integration::Util::Payments::CancelPaymentRequestBuilder.new
                                                                                        .with_amount(600)
                                                                                        .with_currency(CURRENCY_CODE)
                                                                                        .with_is_final(false)
                                                                                        .build

        expect { @payments.cancel_payment(payment_id, second_cancel_request) }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with invalid payment id' do

      it 'raises ReferenceException' do
        request = Integration::Util::Payments::CancelPaymentRequestBuilder.new.build

        expect { @payments.cancel_payment(NON_EXISTING_PAYMENT_ID, request) }.to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end

    context 'after capture' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_payment_and_get_id

        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)

        expect {
          @payments.cancel_payment(payment_id, Integration::Util::Payments::CancelPaymentRequestBuilder.new.build)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end

      it 'raises ValidationException when partial amount exceeds remaining uncaptured amount' do
        payment_id = @sdk_helper.create_payment_and_get_id(800, CURRENCY_CODE)

        capture_request = Integration::Util::Payments::CapturePaymentRequestBuilder.new
                                                                                   .with_amount(600)
                                                                                   .with_is_final(false)
                                                                                   .build

        @payments.capture_payment(payment_id, capture_request)

        cancel_request = Integration::Util::Payments::CancelPaymentRequestBuilder.new
                                                                                 .with_amount(400)
                                                                                 .with_currency(CURRENCY_CODE)
                                                                                 .with_is_final(false)
                                                                                 .build

        expect { @payments.cancel_payment(payment_id, cancel_request) }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'after refund' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_payment_and_get_id

        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)
        @payments.refund_payment(payment_id, Integration::Util::Payments::RefundRequestBuilder.new.build)

        expect {
          @payments.cancel_payment(payment_id, Integration::Util::Payments::CancelPaymentRequestBuilder.new.build)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'after previous cancel' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_payment_and_get_id

        @payments.cancel_payment(payment_id, Integration::Util::Payments::CancelPaymentRequestBuilder.new.build)

        expect {
          @payments.cancel_payment(payment_id, Integration::Util::Payments::CancelPaymentRequestBuilder.new.build)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end

  describe 'capture_payment' do

    context 'with valid request' do

      it 'returns captured payment' do
        payment_id = @sdk_helper.create_payment_and_get_id

        capture_request = Integration::Util::Payments::CapturePaymentRequestBuilder.new.build
        response = @payments.capture_payment(payment_id, capture_request)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.status).not_to be_nil
      end
    end

    context 'with partial amount' do

      it 'returns captured payment' do
        payment_id = @sdk_helper.create_payment_and_get_id(800, CURRENCY_CODE)

        capture_request = Integration::Util::Payments::CapturePaymentRequestBuilder.new
                                                                                   .with_amount(300)
                                                                                   .with_is_final(false)
                                                                                   .build

        response = @payments.capture_payment(payment_id, capture_request)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.status).not_to be_nil
      end

      it 'returns captured payment when capturing remaining amount' do
        payment_id = @sdk_helper.create_payment_and_get_id(800, CURRENCY_CODE)

        first_capture_request = Integration::Util::Payments::CapturePaymentRequestBuilder.new
                                                                                         .with_amount(300)
                                                                                         .with_is_final(false)
                                                                                         .build

        first_capture_response = @payments.capture_payment(payment_id, first_capture_request)

        expect(first_capture_response).not_to be_nil
        expect(first_capture_response.id).not_to be_nil

        second_capture_request = Integration::Util::Payments::CapturePaymentRequestBuilder.new
                                                                                          .with_amount(500)
                                                                                          .with_is_final(true)
                                                                                          .build

        second_capture_response = @payments.capture_payment(payment_id, second_capture_request)

        expect(second_capture_response).not_to be_nil
        expect(second_capture_response.id).not_to be_nil
      end

      it 'raises ValidationException when second amount exceeds remaining amount' do
        payment_id = @sdk_helper.create_payment_and_get_id(800, CURRENCY_CODE)

        first_capture_request = Integration::Util::Payments::CapturePaymentRequestBuilder.new
                                                                                         .with_amount(300)
                                                                                         .with_is_final(false)
                                                                                         .build

        @payments.capture_payment(payment_id, first_capture_request)

        second_capture_request = Integration::Util::Payments::CapturePaymentRequestBuilder.new
                                                                                          .with_amount(600)
                                                                                          .with_is_final(false)
                                                                                          .build

        expect { @payments.capture_payment(payment_id, second_capture_request) }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'after partial cancel' do

      it 'returns captured payment' do
        payment_id = @sdk_helper.create_payment_and_get_id(800, CURRENCY_CODE)

        @payments.cancel_payment(payment_id,
                                 Integration::Util::Payments::CancelPaymentRequestBuilder.new
                                                                                         .with_amount(600)
                                                                                         .with_currency(CURRENCY_CODE)
                                                                                         .with_is_final(false)
                                                                                         .build)

        capture_request = Integration::Util::Payments::CapturePaymentRequestBuilder.new
                                                                                   .with_amount(200)
                                                                                   .with_is_final(true)
                                                                                   .build

        response = @payments.capture_payment(payment_id, capture_request)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.status).not_to be_nil
      end
    end

    context 'with invalid payment id' do

      it 'raises ReferenceException' do
        expect {
          @payments.capture_payment(NON_EXISTING_PAYMENT_ID, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)
        }.to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end

    context 'after previous capture' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_payment_and_get_id

        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)

        expect {
          @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'after cancel' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_payment_and_get_id

        @payments.cancel_payment(payment_id, Integration::Util::Payments::CancelPaymentRequestBuilder.new.build)

        expect {
          @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'after refund' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_payment_and_get_id

        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)
        @payments.refund_payment(payment_id, Integration::Util::Payments::RefundRequestBuilder.new.build)

        expect {
          @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end

  describe 'refund_payment' do

    context 'with valid request' do

      it 'returns refunded payment after capture' do
        payment_id = @sdk_helper.create_payment_and_get_id

        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)

        refund_request = Integration::Util::Payments::RefundRequestBuilder.new.build
        response = @payments.refund_payment(payment_id, refund_request)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.status).not_to be_nil
      end
    end

    context 'with partial amounts' do

      it 'returns refunded payment for second partial refund' do
        payment_id = @sdk_helper.create_payment_and_get_id(1500, CURRENCY_CODE)

        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)

        first_refund_request = Integration::Util::Payments::RefundRequestBuilder.new
                                                                                .with_amount(300)
                                                                                .with_currency(CURRENCY_CODE)
                                                                                .with_is_final(false)
                                                                                .build

        @payments.refund_payment(payment_id, first_refund_request)

        second_refund_request = Integration::Util::Payments::RefundRequestBuilder.new
                                                                                 .with_amount(400)
                                                                                 .with_currency(CURRENCY_CODE)
                                                                                 .with_is_final(false)
                                                                                 .build

        response = @payments.refund_payment(payment_id, second_refund_request)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.status).not_to eq('REJECTED')
      end

      it 'raises ValidationException with ACTION_NOT_ALLOWED_ON_TRANSACTION when total refund exceeds captured amount' do
        payment_id = @sdk_helper.create_payment_and_get_id(800, CURRENCY_CODE)

        capture_request = Integration::Util::Payments::CapturePaymentRequestBuilder.new
                                                                                   .with_amount(400)
                                                                                   .with_is_final(true)
                                                                                   .build

        @payments.capture_payment(payment_id, capture_request)

        refund_request = Integration::Util::Payments::RefundRequestBuilder.new
                                                                          .with_amount(600)
                                                                          .with_currency(CURRENCY_CODE)
                                                                          .build

        exception = nil
        expect {
          @payments.refund_payment(payment_id, refund_request)
        }.to raise_error(OnlinePayments::SDK::ValidationException) { |e| exception = e }

        expect(exception.errors.first.message).to eq('ACTION_NOT_ALLOWED_ON_TRANSACTION')
      end

      it 'raises ValidationException with ACTION_NOT_ALLOWED_ON_TRANSACTION when single refund exceeds captured amount' do
        payment_id = @sdk_helper.create_payment_and_get_id(800, CURRENCY_CODE)

        capture_request = Integration::Util::Payments::CapturePaymentRequestBuilder.new
                                                                                   .with_amount(300)
                                                                                   .with_is_final(true)
                                                                                   .build

        @payments.capture_payment(payment_id, capture_request)

        refund_request = Integration::Util::Payments::RefundRequestBuilder.new
                                                                          .with_amount(600)
                                                                          .with_currency(CURRENCY_CODE)
                                                                          .build

        exception = nil
        expect {
          @payments.refund_payment(payment_id, refund_request)
        }.to raise_error(OnlinePayments::SDK::ValidationException) { |e| exception = e }

        expect(exception.errors.first.message).to eq('ACTION_NOT_ALLOWED_ON_TRANSACTION')
      end
    end

    context 'with invalid payment id' do

      it 'raises ReferenceException' do
        expect {
          @payments.refund_payment(NON_EXISTING_PAYMENT_ID, Integration::Util::Payments::RefundRequestBuilder.new.build)
        }.to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end

    context 'without capture' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_payment_and_get_id

        expect {
          @payments.refund_payment(payment_id, Integration::Util::Payments::RefundRequestBuilder.new.build)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'after cancel' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_payment_and_get_id

        @payments.cancel_payment(payment_id, Integration::Util::Payments::CancelPaymentRequestBuilder.new.build)

        expect {
          @payments.refund_payment(payment_id, Integration::Util::Payments::RefundRequestBuilder.new.build)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'after previous refund' do

      it 'raises ValidationException with ACTION_NOT_ALLOWED_ON_TRANSACTION when trying to refund already-refunded payment' do
        payment_id = @sdk_helper.create_payment_and_get_id

        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)

        request = Integration::Util::Payments::RefundRequestBuilder.new.build

        first_refund_response = @payments.refund_payment(payment_id, request)

        expect(first_refund_response).not_to be_nil
        expect(first_refund_response.status).to eq('REFUND_REQUESTED')

        exception = nil
        expect {
          @payments.refund_payment(payment_id, request)
        }.to raise_error(OnlinePayments::SDK::ValidationException) { |e| exception = e }

        expect(exception.errors.first.message).to eq('ACTION_NOT_ALLOWED_ON_TRANSACTION')
      end
    end
  end
end
