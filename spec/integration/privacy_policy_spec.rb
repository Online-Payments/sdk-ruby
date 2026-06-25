require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'
require 'securerandom'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/call_context'
require 'integration/util/privacy_policy/get_privacy_policy_params_builder'

RSpec.describe 'PrivacyPolicy' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @privacy_policy = @merchant.privacy_policy
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when getting privacy policy' do

    context 'with valid input' do

      it 'returns get privacy policy response' do
        params = Integration::Util::PrivacyPolicy::GetPrivacyPolicyParamsBuilder.new.build

        response = @privacy_policy.get_privacy_policy(params)

        expect(response).not_to be_nil
        expect(response.html_content).not_to be_nil
      end

      it 'returns get privacy policy response with call context' do
        params = Integration::Util::PrivacyPolicy::GetPrivacyPolicyParamsBuilder.new.build
        context = OnlinePayments::SDK::CallContext.new("test-privacy-policy-#{SecureRandom.uuid}")

        response = @privacy_policy.get_privacy_policy(params, context)

        expect(response).not_to be_nil
        expect(response.html_content).not_to be_nil
      end

      it 'returns privacy policy for specific payment product' do
        params = Integration::Util::PrivacyPolicy::GetPrivacyPolicyParamsBuilder.new.with_visa_product.build

        response = @privacy_policy.get_privacy_policy(params)

        expect(response).not_to be_nil
        expect(response.html_content).not_to be_nil
        expect(params.payment_product_id).to eq(1)
      end
    end

    context 'with different locales' do

      it 'returns privacy policy for english locale' do
        params = Integration::Util::PrivacyPolicy::GetPrivacyPolicyParamsBuilder.new.with_english_locale.build

        response = @privacy_policy.get_privacy_policy(params)

        expect(response).not_to be_nil
        expect(response.html_content).not_to be_nil
        expect(params.locale).to eq('en_US')
      end

      it 'returns privacy policy for dutch locale' do
        params = Integration::Util::PrivacyPolicy::GetPrivacyPolicyParamsBuilder.new.with_dutch_locale.build

        response = @privacy_policy.get_privacy_policy(params)

        expect(response).not_to be_nil
        expect(response.html_content).not_to be_nil
        expect(params.locale).to eq('nl_NL')
      end

      it 'returns privacy policy for french locale' do
        params = Integration::Util::PrivacyPolicy::GetPrivacyPolicyParamsBuilder.new.with_french_locale.build

        response = @privacy_policy.get_privacy_policy(params)

        expect(response).not_to be_nil
        expect(response.html_content).not_to be_nil
        expect(params.locale).to eq('fr_FR')
      end

      it 'returns privacy policy for german locale' do
        params = Integration::Util::PrivacyPolicy::GetPrivacyPolicyParamsBuilder.new.with_german_locale.build

        response = @privacy_policy.get_privacy_policy(params)

        expect(response).not_to be_nil
        expect(response.html_content).not_to be_nil
        expect(params.locale).to eq('de_DE')
      end
    end

    context 'with different payment products' do

      it 'returns privacy policy for visa' do
        params = Integration::Util::PrivacyPolicy::GetPrivacyPolicyParamsBuilder.new.with_visa_product.build

        response = @privacy_policy.get_privacy_policy(params)

        expect(response).not_to be_nil
        expect(response.html_content).not_to be_nil
        expect(params.payment_product_id).to eq(1)
      end

      it 'returns privacy policy for american express' do
        params = Integration::Util::PrivacyPolicy::GetPrivacyPolicyParamsBuilder.new.with_american_express_product.build

        response = @privacy_policy.get_privacy_policy(params)

        expect(response).not_to be_nil
        expect(response.html_content).not_to be_nil
        expect(params.payment_product_id).to eq(2)
      end

      it 'returns privacy policy for master card' do
        params = Integration::Util::PrivacyPolicy::GetPrivacyPolicyParamsBuilder.new.with_master_card_product.build

        response = @privacy_policy.get_privacy_policy(params)

        expect(response).not_to be_nil
        expect(response.html_content).not_to be_nil
        expect(params.payment_product_id).to eq(3)
      end
    end

    context 'with combined parameters' do

      it 'returns privacy policy for specific product and locale' do
        params = Integration::Util::PrivacyPolicy::GetPrivacyPolicyParamsBuilder.new
                                                                                .with_visa_product
                                                                                .with_french_locale
                                                                                .build

        response = @privacy_policy.get_privacy_policy(params)

        expect(response).not_to be_nil
        expect(response.html_content).not_to be_nil
        expect(params.payment_product_id).to eq(1)
        expect(params.locale).to eq('fr_FR')
      end

      it 'returns privacy policy for amex in german' do
        params = Integration::Util::PrivacyPolicy::GetPrivacyPolicyParamsBuilder.new
                                                                                .with_american_express_product
                                                                                .with_german_locale
                                                                                .build

        response = @privacy_policy.get_privacy_policy(params)

        expect(response).not_to be_nil
        expect(response.html_content).not_to be_nil
        expect(params.payment_product_id).to eq(2)
        expect(params.locale).to eq('de_DE')
      end
    end
  end
end
