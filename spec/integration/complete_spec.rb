require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'
require 'securerandom'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/platform_exception'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/validation_exception'
require 'integration/util/complete/complete_payment_request_builder'
require 'integration/util/sdk_test_helper'

RSpec.describe 'Complete' do

  NON_EXISTING_PAYMENT_ID = '9999999999_0'.freeze

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @complete = @merchant.complete

    @sdk_test_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when completing payment' do

    context 'with valid payment id' do

      it 'throws platform exception since redirect payment flow' do
        payment_id = @sdk_test_helper.create_pay_pal_payment_and_get_id
        request = Integration::Util::Complete::CompletePaymentRequestBuilder.new.build

        exception = nil
        expect {
          @complete.complete_payment(payment_id, request)
        }.to raise_error(OnlinePayments::SDK::PlatformException) { |e| exception = e }

        expect(exception.errors).not_to be_nil
        expect(exception.errors.first.http_status_code).not_to be_nil
        expect(exception.errors.first.http_status_code).to eq(500)

        expect(exception.errors.first.category).not_to be_nil
        expect(exception.errors.first.category).to eq('DIRECT_PLATFORM_ERROR')
      end

      it 'throws platform exception since redirect payment flow with call context' do
        payment_id = @sdk_test_helper.create_pay_pal_payment_and_get_id
        request = Integration::Util::Complete::CompletePaymentRequestBuilder.new.build
        context = OnlinePayments::SDK::CallContext.new("test-complete-#{SecureRandom.uuid}")

        exception = nil
        expect {
          @complete.complete_payment(payment_id, request, context)
        }.to raise_error(OnlinePayments::SDK::PlatformException) { |e| exception = e }

        expect(exception.errors).not_to be_nil
        expect(exception.errors.first.http_status_code).not_to be_nil
        expect(exception.errors.first.http_status_code).to eq(500)

        expect(exception.errors.first.category).not_to be_nil
        expect(exception.errors.first.category).to eq('DIRECT_PLATFORM_ERROR')
      end
    end

    context 'with invalid payment id' do

      it 'throws reference exception' do
        request = Integration::Util::Complete::CompletePaymentRequestBuilder.new.build

        expect {
          @complete.complete_payment(NON_EXISTING_PAYMENT_ID, request)
        }.to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end

    context 'with invalid input' do

      it 'throws validation exception when order is nil' do
        payment_id = @sdk_test_helper.create_pay_pal_payment_and_get_id
        request = Integration::Util::Complete::CompletePaymentRequestBuilder.new.with_order(nil).build

        expect {
          @complete.complete_payment(payment_id, request)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end
end
