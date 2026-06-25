require 'spec_helper'
require 'integration_setup'
require 'securerandom'
require 'webmock/rspec'

require 'integration/util/payments/capture_payment_request_builder'
require 'integration/util/sdk_test_helper'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/factory'

NON_EXISTING_PAYMENT_ID_CAPTURES = '9999999999_0'.freeze

RSpec.describe 'Captures' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @payments = @merchant.payments
    @captures = @merchant.captures

    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'get_captures' do

    context 'with existing payment id' do

      it 'returns captures' do
        payment_id = @sdk_helper.create_payment_and_get_id
        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)

        response = @captures.get_captures(payment_id)

        expect(response).not_to be_nil
        expect(response.captures).not_to be_nil
        expect(response.captures).not_to be_empty
        expect(response.captures[0]).not_to be_nil
        expect(response.captures[0].id).not_to be_nil
        expect(response.captures[0].status).not_to be_nil
      end

      it 'returns captures with call context' do
        payment_id = @sdk_helper.create_payment_and_get_id
        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)

        call_context = OnlinePayments::SDK::CallContext.new("test-captures-#{SecureRandom.uuid}")
        response = @captures.get_captures(payment_id, call_context)

        expect(response).not_to be_nil
        expect(response.captures).not_to be_nil
        expect(response.captures).not_to be_empty
        expect(response.captures[0]).not_to be_nil
        expect(response.captures[0].id).not_to be_nil
        expect(response.captures[0].status).not_to be_nil
      end

      it 'returns capture details' do
        payment_id = @sdk_helper.create_payment_and_get_id
        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)

        response = @captures.get_captures(payment_id)

        expect(response).not_to be_nil
        expect(response.captures).not_to be_nil
        expect(response.captures).not_to be_empty
        expect(response.captures[0].id).not_to be_nil
        expect(response.captures[0].status).not_to be_nil
        expect(response.captures[0].capture_output).not_to be_nil
        expect(response.captures[0].status_output).not_to be_nil
      end

      it 'returns multiple captures if they exist' do
        payment_id = @sdk_helper.create_payment_and_get_id
        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)

        response = @captures.get_captures(payment_id)

        expect(response).not_to be_nil
        expect(response.captures).not_to be_nil
        expect(response.captures).not_to be_empty

        response.captures.each do |capture|
          expect(capture.id).not_to be_nil
          expect(capture.status).not_to be_nil
        end
      end
    end

    context 'with invalid payment id' do

      it 'raises ReferenceException with status code 404' do
        exception = nil
        expect {
          @captures.get_captures(NON_EXISTING_PAYMENT_ID_CAPTURES)
        }.to raise_error(OnlinePayments::SDK::ReferenceException) { |e| exception = e }

        expect(exception.status_code).to eq(404)
      end
    end
  end
end
