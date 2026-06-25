require 'securerandom'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'

require 'integration/util/hosted_tokenization/create_hosted_tokenization_request_builder'
require 'integration/util/sdk_test_helper'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/validation_exception'

INVALID_TOKENIZATION_ID = 'invalid_id_12345'.freeze

RSpec.describe 'HostedTokenization' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @hosted_tokenization = @merchant.hosted_tokenization

    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when creating hosted tokenization' do
    context 'with valid input' do
      it 'returns hosted tokenization id and url' do
        request = Integration::Util::HostedTokenization::CreateHostedTokenizationRequestBuilder.new.build

        response = @hosted_tokenization.create_hosted_tokenization(request)

        expect(response).not_to be_nil
        expect(response.hosted_tokenization_id).not_to be_nil
        expect(response.hosted_tokenization_url).not_to be_nil
      end

      it 'returns hosted tokenization id and url with call context' do
        request = Integration::Util::HostedTokenization::CreateHostedTokenizationRequestBuilder.new.build
        call_context = OnlinePayments::SDK::CallContext.new("test-hosted-tokenization-#{SecureRandom.uuid}")

        response = @hosted_tokenization.create_hosted_tokenization(request, call_context)

        expect(response).not_to be_nil
        expect(response.hosted_tokenization_id).not_to be_nil
        expect(response.hosted_tokenization_url).not_to be_nil
      end
    end

    context 'with invalid locale' do
      it 'throws ValidationException' do
        request = Integration::Util::HostedTokenization::CreateHostedTokenizationRequestBuilder.new
                                                                                               .with_locale('invalid_locale')
                                                                                               .build

        expect { @hosted_tokenization.create_hosted_tokenization(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with tokens' do
      context 'with single invalid token' do
        it 'returns session with single invalid token' do
          request = Integration::Util::HostedTokenization::CreateHostedTokenizationRequestBuilder.new
                                                                                                 .with_token('firstInvalidToken')
                                                                                                 .build

          response = @hosted_tokenization.create_hosted_tokenization(request)

          expect(response).not_to be_nil
          expect(response.hosted_tokenization_id).not_to be_nil
          expect(response.hosted_tokenization_url).not_to be_nil
          expect(response.invalid_tokens).not_to be_nil
          expect(response.invalid_tokens.size).to eq(1)
          expect(response.invalid_tokens).to include('firstInvalidToken')
        end
      end

      context 'with multiple invalid tokens' do
        it 'returns session with multiple invalid tokens' do
          request = Integration::Util::HostedTokenization::CreateHostedTokenizationRequestBuilder.new
                                                                                                 .with_tokens('firstInvalidToken', 'secondInvalidToken')
                                                                                                 .build

          response = @hosted_tokenization.create_hosted_tokenization(request)

          expect(response).not_to be_nil
          expect(response.hosted_tokenization_id).not_to be_nil
          expect(response.hosted_tokenization_url).not_to be_nil
          expect(response.invalid_tokens).not_to be_nil
          expect(response.invalid_tokens.size).to eq(2)
          expect(response.invalid_tokens).to include('firstInvalidToken')
          expect(response.invalid_tokens).to include('secondInvalidToken')
        end
      end

      context 'with chained tokens' do
        it 'supports chained token addition' do
          request = Integration::Util::HostedTokenization::CreateHostedTokenizationRequestBuilder.new
                                                                                                 .with_token('firstChainedToken')
                                                                                                 .with_token('secondChainedToken')
                                                                                                 .with_token('thirdChainedToken')
                                                                                                 .build

          response = @hosted_tokenization.create_hosted_tokenization(request)

          expect(response).not_to be_nil
          expect(response.hosted_tokenization_id).not_to be_nil
          expect(response.hosted_tokenization_url).not_to be_nil
          expect(response.invalid_tokens).not_to be_nil
          expect(response.invalid_tokens.size).to eq(3)
          expect(response.invalid_tokens).to include('firstChainedToken')
          expect(response.invalid_tokens).to include('secondChainedToken')
          expect(response.invalid_tokens).to include('thirdChainedToken')
        end
      end

      context 'with empty token list' do
        it 'handles empty token list' do
          request = Integration::Util::HostedTokenization::CreateHostedTokenizationRequestBuilder.new
                                                                                                 .with_tokens
                                                                                                 .build

          response = @hosted_tokenization.create_hosted_tokenization(request)

          expect(response).not_to be_nil
          expect(response.hosted_tokenization_id).not_to be_nil
          expect(response.hosted_tokenization_url).not_to be_nil
          expect(response.invalid_tokens.size).to eq(0)
        end
      end

      context 'with tokens containing special characters' do
        it 'handles tokens with special characters' do
          request = Integration::Util::HostedTokenization::CreateHostedTokenizationRequestBuilder.new
                                                                                                 .with_tokens('token-with-dashes', 'token_with_underscores', 'token.with.dots')
                                                                                                 .build

          response = @hosted_tokenization.create_hosted_tokenization(request)

          expect(response).not_to be_nil
          expect(response.hosted_tokenization_id).not_to be_nil
          expect(response.hosted_tokenization_url).not_to be_nil
          expect(response.invalid_tokens).not_to be_nil
          expect(response.invalid_tokens.size).to eq(3)
        end
      end

      context 'with large number of tokens' do
        it 'handles ten invalid tokens' do
          request = Integration::Util::HostedTokenization::CreateHostedTokenizationRequestBuilder.new
                                                                                                 .with_tokens(
                                                                                                   'firstToken', 'secondToken', 'thirdToken', 'fourthToken', 'fifthToken',
                                                                                                   'sixthToken', 'seventhToken', 'eighthToken', 'ninthToken', 'tenthToken'
                                                                                                 )
                                                                                                 .build

          response = @hosted_tokenization.create_hosted_tokenization(request)

          expect(response).not_to be_nil
          expect(response.hosted_tokenization_id).not_to be_nil
          expect(response.hosted_tokenization_url).not_to be_nil
          expect(response.invalid_tokens).not_to be_nil
          expect(response.invalid_tokens.size).to eq(10)
        end
      end

      context 'with duplicate tokens' do
        it 'handles duplicate tokens' do
          request = Integration::Util::HostedTokenization::CreateHostedTokenizationRequestBuilder.new
                                                                                                 .with_tokens('duplicateToken', 'duplicateToken', 'uniqueToken')
                                                                                                 .build

          response = @hosted_tokenization.create_hosted_tokenization(request)

          expect(response).not_to be_nil
          expect(response.hosted_tokenization_id).not_to be_nil
          expect(response.hosted_tokenization_url).not_to be_nil
          expect(response.invalid_tokens).not_to be_nil
          expect(response.invalid_tokens).not_to be_empty
        end
      end
    end
  end

  describe 'when getting hosted tokenization' do
    context 'with valid hosted tokenization id' do
      it 'returns hosted tokenization details' do
        hosted_tokenization_id = @sdk_helper.create_hosted_tokenization_and_get_id

        response = @hosted_tokenization.get_hosted_tokenization(hosted_tokenization_id)

        expect(response).not_to be_nil
      end
    end

    context 'with invalid hosted tokenization id' do
      it 'throws ReferenceException' do
        expect { @hosted_tokenization.get_hosted_tokenization(INVALID_TOKENIZATION_ID) }
          .to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end
  end
end
