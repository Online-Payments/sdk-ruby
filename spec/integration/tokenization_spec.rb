require 'securerandom'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'

require 'integration/util/common/create_payment_request_builder'
require 'integration/util/common/create_token_request_builder'
require 'integration/util/sdk_test_helper'
require 'integration/util/tokenization/csr_request_builder'
require 'integration/util/tokenization/get_card_data_by_tokens_params_builder'
require 'integration/util/tokenization/get_card_data_by_payments_params_builder'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/validation_exception'

RSpec.describe 'Tokenization' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @tokenization = @merchant.tokenization
    @payments = @merchant.payments

    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  context 'when creating a certificate' do
    context 'with valid input' do
      it 'returns certificate response' do
        skip "Test is skipped because the Tokenization endpoint features are not enabled for the test merchant."
        request = Integration::Util::Tokenization::CsrRequestBuilder.new.build

        response = @tokenization.create_certificate(request)

        expect(response).not_to be_nil
        expect(response.signed_certificate).not_to be_nil
        expect(response.certificate_id).not_to be_nil
      end

      it 'returns certificate response with call context' do
        skip "Test is skipped because the Tokenization endpoint features are not enabled for the test merchant."
        request = Integration::Util::Tokenization::CsrRequestBuilder.new.build
        call_context = OnlinePayments::SDK::CallContext.new("test-tokenization-#{SecureRandom.uuid}")

        response = @tokenization.create_certificate(request, call_context)

        expect(response).not_to be_nil
        expect(response.signed_certificate).not_to be_nil
        expect(response.certificate_id).not_to be_nil
      end
    end

    context 'with invalid input' do
      it 'throws ValidationException' do
        request = Integration::Util::Tokenization::CsrRequestBuilder.new.with_csr(nil).build

        expect { @tokenization.create_certificate(request) }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end

  context 'when getting card data by tokens' do
    context 'with valid tokens' do
      it 'returns detokenized card data' do
        skip "Test is skipped because the Tokenization endpoint features are not enabled for the test merchant."
        token_id = @sdk_helper.create_token_and_get_id

        params = Integration::Util::Tokenization::GetCardDataByTokensParamsBuilder.new
                                                                                  .with_tokens([token_id])
                                                                                  .build

        response = @tokenization.get_card_data_by_tokens(params)

        expect(response).not_to be_nil
        expect(response.tokens).not_to be_nil
      end
    end

    context 'with non-existent tokens' do
      it 'throws ReferenceException' do
        skip "Test is skipped because the Tokenization endpoint features are not enabled for the test merchant."
        params = Integration::Util::Tokenization::GetCardDataByTokensParamsBuilder.new
                                                                                  .with_tokens(['non-existent-token-xyz'])
                                                                                  .build

        expect { @tokenization.get_card_data_by_tokens(params) }.to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end

    context 'with invalid tokens' do
      it 'throws ValidationException' do
        params = Integration::Util::Tokenization::GetCardDataByTokensParamsBuilder.new
                                                                                  .with_tokens(nil)
                                                                                  .build

        expect { @tokenization.get_card_data_by_tokens(params) }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end

  context 'when getting card data by payments' do
    context 'with valid payment ids' do
      it 'returns detokenized card data' do
        skip "Test is skipped because the Tokenization endpoint features are not enabled for the test merchant."
        token_id = @sdk_helper.create_token_and_get_id

        payment_request = Integration::Util::Common::CreatePaymentRequestBuilder.new.with_token(token_id).build
        payment_response = @payments.create_payment(payment_request)

        params = Integration::Util::Tokenization::GetCardDataByPaymentsParamsBuilder.new
                                                                                    .with_payments([payment_response.payment.id])
                                                                                    .build

        response = @tokenization.get_card_data_by_payments(params)

        expect(response).not_to be_nil
        expect(response.tokens).not_to be_nil
      end
    end

    context 'with non-existent payment ids' do
      it 'throws ReferenceException' do
        skip "Test is skipped because the Tokenization endpoint features are not enabled for the test merchant."
        params = Integration::Util::Tokenization::GetCardDataByPaymentsParamsBuilder.new
                                                                                    .with_payments(['non-existent-payment'])
                                                                                    .build

        expect { @tokenization.get_card_data_by_payments(params) }.to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end

    context 'with invalid payment ids' do
      it 'throws ValidationException' do
        params = Integration::Util::Tokenization::GetCardDataByPaymentsParamsBuilder.new
                                                                                    .with_payments(nil)
                                                                                    .build

        expect { @tokenization.get_card_data_by_payments(params) }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end
end
