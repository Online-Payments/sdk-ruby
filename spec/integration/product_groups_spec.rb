require 'securerandom'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'

require 'integration/util/product_groups/get_product_groups_params_builder'
require 'integration/util/product_groups/get_product_group_params_builder'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/validation_exception'

PRODUCT_GROUPS_COUNTRY_CODE = 'NL'.freeze
PRODUCT_GROUPS_CURRENCY_CODE = 'EUR'.freeze
VALID_PAYMENT_PRODUCT_GROUP_ID = 'cards'.freeze
INVALID_PAYMENT_PRODUCT_GROUP_ID = 'invalid-group-id'.freeze

RSpec.describe 'ProductGroups' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @product_groups = @merchant.product_groups
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when getting product groups' do

    context 'with valid request' do

      it 'returns product groups' do
        params = Integration::Util::ProductGroups::GetProductGroupsParamsBuilder.new
                                                                                .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                                .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                                .build

        response = @product_groups.get_product_groups(params)

        expect(response).not_to be_nil
        expect(response.payment_product_groups).not_to be_nil
        expect(response.payment_product_groups).not_to be_empty
        expect(response.payment_product_groups[0]).not_to be_nil
      end

      it 'returns product groups with call context' do
        params = Integration::Util::ProductGroups::GetProductGroupsParamsBuilder.new
                                                                                .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                                .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                                .build

        call_context = OnlinePayments::SDK::CallContext.new("test-product-groups-#{SecureRandom.uuid}")

        response = @product_groups.get_product_groups(params, call_context)

        expect(response).not_to be_nil
        expect(response.payment_product_groups).not_to be_nil
        expect(response.payment_product_groups).not_to be_empty
        expect(response.payment_product_groups[0]).not_to be_nil
      end
    end

    context 'with optional parameters' do

      it 'returns product groups with amount' do
        params = Integration::Util::ProductGroups::GetProductGroupsParamsBuilder.new
                                                                                .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                                .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                                .with_amount(1000)
                                                                                .build

        response = @product_groups.get_product_groups(params)

        expect(response).not_to be_nil
        expect(response.payment_product_groups).not_to be_nil
      end

      it 'returns product groups with is recurring' do
        params = Integration::Util::ProductGroups::GetProductGroupsParamsBuilder.new
                                                                                .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                                .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                                .with_is_recurring(true)
                                                                                .build

        response = @product_groups.get_product_groups(params)

        expect(response).not_to be_nil
        expect(response.payment_product_groups).not_to be_nil
      end

      it 'returns product groups with add hide' do
        params = Integration::Util::ProductGroups::GetProductGroupsParamsBuilder.new
                                                                                .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                                .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                                .with_hide('fields')
                                                                                .with_hide('accountsOnFile')
                                                                                .build

        response = @product_groups.get_product_groups(params)

        expect(response).not_to be_nil
        expect(response.payment_product_groups).not_to be_nil
        expect(params.hide).not_to be_nil
        expect(params.hide.size).to eq(2)
        expect(params.hide).to include('fields')
        expect(params.hide).to include('accountsOnFile')
      end

      it 'returns product groups with hide list' do
        hide_fields = %w[fields translations]

        params = Integration::Util::ProductGroups::GetProductGroupsParamsBuilder.new
                                                                                .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                                .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                                .with_hide_list(hide_fields)
                                                                                .build

        response = @product_groups.get_product_groups(params)

        expect(response).not_to be_nil
        expect(response.payment_product_groups).not_to be_nil
        expect(params.hide).to eq(hide_fields)
      end

      it 'skips null hide element in get product groups params' do
        params = Integration::Util::ProductGroups::GetProductGroupsParamsBuilder.new
                                                                                .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                                .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                                .with_hide('fields')
                                                                                .with_hide(nil)
                                                                                .build

        response = @product_groups.get_product_groups(params)

        expect(response).not_to be_nil
        expect(response.payment_product_groups).not_to be_nil
        expect(params.hide.size).to eq(2)
        expect(params.hide).to include(nil)
      end

      it 'verifies get product groups params getters' do
        params = Integration::Util::ProductGroups::GetProductGroupsParamsBuilder.new
                                                                                .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                                .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                                .with_amount(1000)
                                                                                .with_is_recurring(true)
                                                                                .build

        expect(params.country_code).to eq(PRODUCT_GROUPS_COUNTRY_CODE)
        expect(params.currency_code).to eq(PRODUCT_GROUPS_CURRENCY_CODE)
        expect(params.amount).to eq(1000)
        expect(params.is_recurring).to be true
      end
    end

    context 'with missing country code' do

      it 'raises ValidationException' do
        params = Integration::Util::ProductGroups::GetProductGroupsParamsBuilder.new
                                                                                .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                                .build

        exception = nil
        expect { @product_groups.get_product_groups(params) }
          .to raise_error(OnlinePayments::SDK::ValidationException) { |e| exception = e }

        expect(exception.status_code).to eq(400)
      end
    end
  end

  describe 'when getting product group' do

    context 'with valid payment product group id' do

      it 'returns product group' do
        params = Integration::Util::ProductGroups::GetProductGroupParamsBuilder.new
                                                                               .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                               .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                               .build

        response = @product_groups.get_product_group(VALID_PAYMENT_PRODUCT_GROUP_ID, params)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.id.downcase).to eq(VALID_PAYMENT_PRODUCT_GROUP_ID)
      end

      it 'returns product group with amount' do
        params = Integration::Util::ProductGroups::GetProductGroupParamsBuilder.new
                                                                               .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                               .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                               .with_amount(2500)
                                                                               .build

        response = @product_groups.get_product_group(VALID_PAYMENT_PRODUCT_GROUP_ID, params)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.id.downcase).to eq(VALID_PAYMENT_PRODUCT_GROUP_ID)
      end

      it 'returns product group with is recurring' do
        params = Integration::Util::ProductGroups::GetProductGroupParamsBuilder.new
                                                                               .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                               .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                               .with_is_recurring(true)
                                                                               .build

        response = @product_groups.get_product_group(VALID_PAYMENT_PRODUCT_GROUP_ID, params)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.id.downcase).to eq(VALID_PAYMENT_PRODUCT_GROUP_ID)
      end

      it 'returns product group with add hide' do
        params = Integration::Util::ProductGroups::GetProductGroupParamsBuilder.new
                                                                               .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                               .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                               .with_hide('accountsOnFile')
                                                                               .build

        response = @product_groups.get_product_group(VALID_PAYMENT_PRODUCT_GROUP_ID, params)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.id.downcase).to eq(VALID_PAYMENT_PRODUCT_GROUP_ID)
        expect(params.hide).not_to be_nil
        expect(params.hide.size).to eq(1)
        expect(params.hide).to include('accountsOnFile')
      end

      it 'returns product group with hide list' do
        hide_fields = ['fields']

        params = Integration::Util::ProductGroups::GetProductGroupParamsBuilder.new
                                                                               .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                               .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                               .with_hide_list(hide_fields)
                                                                               .build

        response = @product_groups.get_product_group(VALID_PAYMENT_PRODUCT_GROUP_ID, params)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.id.downcase).to eq(VALID_PAYMENT_PRODUCT_GROUP_ID)
        expect(params.hide).to eq(hide_fields)
      end

      it 'skips null hide element in get product group params' do
        params = Integration::Util::ProductGroups::GetProductGroupParamsBuilder.new
                                                                               .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                               .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                               .with_hide('accountsOnFile')
                                                                               .with_hide(nil)
                                                                               .build

        response = @product_groups.get_product_group(VALID_PAYMENT_PRODUCT_GROUP_ID, params)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.id.downcase).to eq(VALID_PAYMENT_PRODUCT_GROUP_ID)
        expect(params.hide.size).to eq(2)
        expect(params.hide).to include(nil)
      end

      it 'verifies get product group params getters' do
        params = Integration::Util::ProductGroups::GetProductGroupParamsBuilder.new
                                                                               .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                               .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                               .with_amount(2500)
                                                                               .with_is_recurring(false)
                                                                               .build

        expect(params.country_code).to eq(PRODUCT_GROUPS_COUNTRY_CODE)
        expect(params.currency_code).to eq(PRODUCT_GROUPS_CURRENCY_CODE)
        expect(params.amount).to eq(2500)
        expect(params.is_recurring).to be false
      end
    end

    context 'with invalid payment product group id' do

      it 'raises ApiException' do
        params = Integration::Util::ProductGroups::GetProductGroupParamsBuilder.new
                                                                               .with_country_code(PRODUCT_GROUPS_COUNTRY_CODE)
                                                                               .with_currency_code(PRODUCT_GROUPS_CURRENCY_CODE)
                                                                               .build

        exception = nil
        expect { @product_groups.get_product_group(INVALID_PAYMENT_PRODUCT_GROUP_ID, params) }
          .to raise_error(OnlinePayments::SDK::ApiException) { |e| exception = e }

        expect(exception.status_code).to eq(404)
      end
    end
  end
end
