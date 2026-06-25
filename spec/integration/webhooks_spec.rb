require 'securerandom'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'

require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/validation_exception'

require 'integration/util/webhooks/validate_credentials_request_builder'
require 'integration/util/webhooks/send_test_request_builder'

VALID_WEBHOOK_KEY = 'test-key'.freeze
VALID_WEBHOOK_SECRET = 'test-secret'.freeze
INVALID_WEBHOOK_URL = 'invalid-url'.freeze
VALID_WEBHOOK_URL = 'https://example.com/webhook'.freeze

RSpec.describe 'Webhooks' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @webhooks = @client.merchant(Integration::MERCHANT_ID).webhooks
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'validate_webhook_credentials' do

    context 'with credentials' do

      it 'returns result' do
        request = Integration::Util::Webhooks::ValidateCredentialsRequestBuilder.new
                    .with_key(VALID_WEBHOOK_KEY)
                    .with_secret(VALID_WEBHOOK_SECRET)
                    .build

        response = @webhooks.validate_webhook_credentials(request)

        expect(response).not_to be_nil
        expect(response.result).not_to be_nil
      end

      it 'returns result when call context is provided' do
        request = Integration::Util::Webhooks::ValidateCredentialsRequestBuilder.new
                    .with_key(VALID_WEBHOOK_KEY)
                    .with_secret(VALID_WEBHOOK_SECRET)
                    .build

        context = OnlinePayments::SDK::CallContext.new("test-webhooks-#{SecureRandom.uuid}")
        response = @webhooks.validate_webhook_credentials(request, context)

        expect(response).not_to be_nil
        expect(response.result).not_to be_nil
      end

      it 'returns invalid result with incorrect secret' do
        request = Integration::Util::Webhooks::ValidateCredentialsRequestBuilder.new
                    .with_key(VALID_WEBHOOK_KEY)
                    .with_secret('incorrect-secret')
                    .build

        response = @webhooks.validate_webhook_credentials(request)

        expect(response).not_to be_nil
        expect(response.result).not_to be_nil
        expect(response.result).to eq('Invalid')
      end
    end
  end

  describe 'send_test_webhook' do

    context 'without webhook configuration' do

      it 'raises ValidationException' do
        request = Integration::Util::Webhooks::SendTestRequestBuilder.new
                     .with_url(VALID_WEBHOOK_URL)
                     .build

        expect {
          @webhooks.send_test_webhook(request)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end

      it 'raises ValidationException without url' do
        request = Integration::Util::Webhooks::SendTestRequestBuilder.new.build

        expect {
          @webhooks.send_test_webhook(request)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with invalid url' do

      it 'raises ValidationException' do
        request = Integration::Util::Webhooks::SendTestRequestBuilder.new
                     .with_url(INVALID_WEBHOOK_URL)
                     .build

        expect {
          @webhooks.send_test_webhook(request)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end
end
