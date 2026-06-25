require 'spec_helper'
require 'integration_setup'
require 'securerandom'
require 'webmock/rspec'

require 'integration/util/payments/capture_payment_request_builder'
require 'integration/util/payments/refund_request_builder'
require 'integration/util/sdk_test_helper'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/factory'

NON_EXISTING_PAYMENT_ID_REFUNDS = '9999999999_0'.freeze

RSpec.describe 'Refunds' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @payments = @merchant.payments
    @refunds = @merchant.refunds

    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'get_refunds' do

    context 'with existing payment id' do

      it 'returns refunds' do
        payment_id = @sdk_helper.create_payment_and_get_id
        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)
        @payments.refund_payment(payment_id, Integration::Util::Payments::RefundRequestBuilder.new.build)

        response = @refunds.get_refunds(payment_id)

        expect(response).not_to be_nil
        expect(response.refunds).not_to be_nil
        expect(response.refunds).not_to be_empty
        expect(response.refunds[0]).not_to be_nil
        expect(response.refunds[0].id).not_to be_nil
        expect(response.refunds[0].status).not_to be_nil
      end

      it 'returns refunds with call context' do
        payment_id = @sdk_helper.create_payment_and_get_id
        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)
        @payments.refund_payment(payment_id, Integration::Util::Payments::RefundRequestBuilder.new.build)

        call_context = OnlinePayments::SDK::CallContext.new("test-refunds-#{SecureRandom.uuid}")
        response = @refunds.get_refunds(payment_id, call_context)

        expect(response).not_to be_nil
        expect(response.refunds).not_to be_nil
        expect(response.refunds).not_to be_empty
        expect(response.refunds[0]).not_to be_nil
        expect(response.refunds[0].id).not_to be_nil
        expect(response.refunds[0].status).not_to be_nil
      end

      it 'returns refund details' do
        payment_id = @sdk_helper.create_payment_and_get_id
        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)
        @payments.refund_payment(payment_id, Integration::Util::Payments::RefundRequestBuilder.new.build)

        response = @refunds.get_refunds(payment_id)

        expect(response).not_to be_nil
        expect(response.refunds).not_to be_nil
        expect(response.refunds).not_to be_empty
        expect(response.refunds[0].id).not_to be_nil
        expect(response.refunds[0].status).not_to be_nil
        expect(response.refunds[0].refund_output).not_to be_nil
        expect(response.refunds[0].status_output).not_to be_nil
      end

      it 'returns multiple refunds if they exist' do
        payment_id = @sdk_helper.create_payment_and_get_id
        @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)
        @payments.refund_payment(payment_id, Integration::Util::Payments::RefundRequestBuilder.new.build)

        response = @refunds.get_refunds(payment_id)

        expect(response).not_to be_nil
        expect(response.refunds).not_to be_nil
        expect(response.refunds).not_to be_empty

        response.refunds.each do |refund|
          expect(refund.id).not_to be_nil
          expect(refund.status).not_to be_nil
        end
      end
    end

    context 'with invalid payment id' do

      it 'raises ReferenceException with status code 404' do
        exception = nil
        expect {
          @refunds.get_refunds(NON_EXISTING_PAYMENT_ID_REFUNDS)
        }.to raise_error(OnlinePayments::SDK::ReferenceException) { |e| exception = e }

        expect(exception.status_code).to eq(404)
      end
    end
  end
end