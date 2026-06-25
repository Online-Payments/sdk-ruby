require 'securerandom'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'

require 'integration/util/sdk_test_helper'
require 'integration/util/sessions/session_request_builder'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/validation_exception'

RSpec.describe 'Sessions' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @sessions = @merchant.sessions

    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when creating session' do

    context 'with valid input' do

      it 'returns client session id' do
        request = Integration::Util::Sessions::SessionRequestBuilder.new
                                                                    .build

        response = @sessions.create_session(request)

        expect(response).not_to be_nil
        expect(response.client_session_id).not_to be_nil
        expect(response.asset_url).not_to be_nil
        expect(response.client_api_url).not_to be_nil
      end

      it 'returns client session id with call context' do
        request = Integration::Util::Sessions::SessionRequestBuilder.new
                                                                    .build
        call_context = OnlinePayments::SDK::CallContext.new("test-session-#{SecureRandom.uuid}")

        response = @sessions.create_session(request, call_context)

        expect(response).not_to be_nil
        expect(response.client_session_id).not_to be_nil
        expect(response.asset_url).not_to be_nil
        expect(response.client_api_url).not_to be_nil
      end
    end

    context 'with valid tokens' do

      it 'returns session with valid token' do
        token_id = @sdk_helper.create_token_and_get_id
        request = Integration::Util::Sessions::SessionRequestBuilder.new
                                                                    .with_token(token_id)
                                                                    .build

        response = @sessions.create_session(request)

        expect(response).not_to be_nil
        expect(response.client_session_id).not_to be_nil
        expect(response.invalid_tokens).to satisfy { |t| t.nil? || !t.include?(token_id) }
      end
    end

    context 'with too many tokens' do

      it 'raises ValidationException' do
        request = Integration::Util::Sessions::SessionRequestBuilder.new
                                                                    .with_tokens(
                                                                      'firstToken', 'secondToken', 'thirdToken', 'fourthToken', 'fifthToken',
                                                                      'sixthToken', 'seventhToken', 'eighthToken', 'ninthToken', 'tenthToken', 'eleventhToken'
                                                                    )
                                                                    .build

        expect { @sessions.create_session(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with invalid token values' do

      it 'returns session with invalid tokens' do
        request = Integration::Util::Sessions::SessionRequestBuilder.new
                                                                    .with_tokens('65468465464646', '654646464', 'easgudasdas')
                                                                    .build

        response = @sessions.create_session(request)

        expect(response).not_to be_nil
        expect(response.client_session_id).not_to be_nil
        expect(response.invalid_tokens).not_to be_nil
        expect(response.invalid_tokens).not_to be_empty
      end
    end
  end
end
