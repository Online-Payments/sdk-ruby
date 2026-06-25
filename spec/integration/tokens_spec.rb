require 'securerandom'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'

require 'integration/util/common/create_token_request_builder'
require 'integration/util/sdk_test_helper'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/validation_exception'

INVALID_TOKEN_ID = 'invalid_token_12345'.freeze
EXPECTED_CARDHOLDER_NAME = 'John Doe'.freeze
EXPECTED_EXPIRY_DATE = '1230'.freeze

RSpec.describe 'Tokens' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @tokens = @merchant.tokens

    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  context 'when creating token' do
    context 'with valid input' do
      it 'returns valid response' do
        request = Integration::Util::Common::CreateTokenRequestBuilder.new.build

        response = @tokens.create_token(request)

        expect(response).not_to be_nil
        expect(response.token).not_to be_nil
        expect(response.card).not_to be_nil
        expect(response.card.cardholder_name).to eq(EXPECTED_CARDHOLDER_NAME)
        expect(response.card.expiry_date).to eq(EXPECTED_EXPIRY_DATE)
        expect(response.card.card_number).not_to be_nil
      end

      it 'returns valid response with call context' do
        request = Integration::Util::Common::CreateTokenRequestBuilder.new.build
        call_context = OnlinePayments::SDK::CallContext.new("test-tokens-#{SecureRandom.uuid}")

        response = @tokens.create_token(request, call_context)

        expect(response).not_to be_nil
        expect(response.token).not_to be_nil
        expect(response.card).not_to be_nil
        expect(response.card.cardholder_name).to eq(EXPECTED_CARDHOLDER_NAME)
        expect(response.card.expiry_date).to eq(EXPECTED_EXPIRY_DATE)
        expect(response.card.card_number).not_to be_nil
      end
    end

    context 'with invalid card number' do
      it 'throws ValidationException' do
        request = Integration::Util::Common::CreateTokenRequestBuilder.new
                                                                      .with_card_number('1234567890123456')
                                                                      .build

        expect { @tokens.create_token(request) }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with invalid expiry date' do
      it 'throws ValidationException' do
        request = Integration::Util::Common::CreateTokenRequestBuilder.new
                                                                      .with_expiry_date('0000')
                                                                      .build

        expect { @tokens.create_token(request) }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with invalid cvv' do
      it 'throws ValidationException' do
        request = Integration::Util::Common::CreateTokenRequestBuilder.new
                                                                      .with_cvv('12345678')
                                                                      .build

        expect { @tokens.create_token(request) }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end

  context 'when getting token' do
    context 'with valid token id' do
      it 'returns token details' do
        token_id = @sdk_helper.create_token_and_get_id

        response = @tokens.get_token(token_id)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.id).to eq(token_id)
        expect(response.payment_product_id).not_to be_nil
        expect(response.card).not_to be_nil
        expect(response.card.data).not_to be_nil
        expect(response.card.data.card_without_cvv).not_to be_nil
        expect(response.card.data.card_without_cvv.card_number).not_to be_nil
      end
    end

    context 'with invalid token id' do
      it 'throws ReferenceException' do
        expect { @tokens.get_token(INVALID_TOKEN_ID) }.to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end
  end

  context 'when deleting token' do
    context 'with valid token id' do
      it 'deletes the token' do
        token_id = @sdk_helper.create_token_and_get_id

        @tokens.delete_token(token_id)

        expect { @tokens.get_token(token_id) }.to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end

    context 'with invalid token id' do
      it 'throws ReferenceException' do
        expect { @tokens.delete_token(INVALID_TOKEN_ID) }.to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end
  end
end
