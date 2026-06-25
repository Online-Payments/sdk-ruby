require 'securerandom'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'

require 'integration/util/sdk_test_helper'
require 'integration/util/subsequent/subsequent_payment_request_builder'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/validation_exception'

SUBSEQUENT_NON_EXISTING_PAYMENT_ID = '9999999999'.freeze

RSpec.describe 'Subsequents' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @subsequent = @merchant.subsequent

    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when creating subsequent payment' do

    context 'with valid input' do

      it 'returns payment id' do
        payment_id = @sdk_helper.create_payment_and_get_id
        request = Integration::Util::Subsequent::SubsequentPaymentRequestBuilder.new
                                                                                .build

        response = @subsequent.subsequent_payment(payment_id, request)

        expect(response).not_to be_nil
        expect(response.payment).not_to be_nil
        expect(response.payment.id).not_to be_nil
        expect(response.payment.status).not_to be_nil
      end

      it 'returns payment id with call context' do
        payment_id = @sdk_helper.create_payment_and_get_id
        request = Integration::Util::Subsequent::SubsequentPaymentRequestBuilder.new
                                                                                .build
        call_context = OnlinePayments::SDK::CallContext.new("test-subsequent-#{SecureRandom.uuid}")

        response = @subsequent.subsequent_payment(payment_id, request, call_context)

        expect(response).not_to be_nil
        expect(response.payment).not_to be_nil
        expect(response.payment.id).not_to be_nil
        expect(response.payment.status).not_to be_nil
      end
    end

    context 'with invalid amount' do

      it 'raises ValidationException' do
        payment_id = @sdk_helper.create_payment_and_get_id
        request = Integration::Util::Subsequent::SubsequentPaymentRequestBuilder.new
                                                                                .with_amount(-1000)
                                                                                .build

        expect { @subsequent.subsequent_payment(payment_id, request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with invalid payment id' do

      it 'raises ReferenceException' do
        request = Integration::Util::Subsequent::SubsequentPaymentRequestBuilder.new
                                                                                .build

        expect { @subsequent.subsequent_payment(SUBSEQUENT_NON_EXISTING_PAYMENT_ID, request) }
          .to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end
  end
end
