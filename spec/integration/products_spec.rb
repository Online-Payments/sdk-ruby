require 'securerandom'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'

require 'integration/util/products/get_payment_products_params_builder'
require 'integration/util/products/get_payment_product_params_builder'
require 'integration/util/products/get_payment_product_networks_params_builder'
require 'integration/util/products/get_product_directory_params_builder'
require 'integration/util/products/payment_product_session_request_builder'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/api_exception'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/validation_exception'

PRODUCTS_COUNTRY_CODE = 'NL'.freeze
PRODUCTS_CURRENCY_CODE = 'EUR'.freeze
VALID_PAYMENT_PRODUCT_ID = 1
VALID_PAYMENT_PRODUCT_NETWORKS_ID = 302
VALID_PAYMENT_PRODUCT_DIRECTORY_ID = 809
INVALID_PAYMENT_PRODUCT_ID = -1

RSpec.describe 'Products' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @products = @merchant.products
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when getting payment products' do

    context 'with valid request' do

      it 'returns payment products' do
        params = Integration::Util::Products::GetPaymentProductsParamsBuilder.new
                                                                             .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                             .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                             .build

        response = @products.get_payment_products(params)

        expect(response).not_to be_nil
        expect(response.payment_products).not_to be_nil
        expect(response.payment_products).not_to be_empty
        expect(response.payment_products[0]).not_to be_nil
        expect(response.payment_products[0].id).to be > 0
      end

      it 'returns payment products with call context' do
        params = Integration::Util::Products::GetPaymentProductsParamsBuilder.new
                                                                             .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                             .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                             .build

        call_context = OnlinePayments::SDK::CallContext.new("test-products-#{SecureRandom.uuid}")

        response = @products.get_payment_products(params, call_context)

        expect(response).not_to be_nil
        expect(response.payment_products).not_to be_nil
        expect(response.payment_products).not_to be_empty
        expect(response.payment_products[0]).not_to be_nil
        expect(response.payment_products[0].id).to be > 0
      end
    end

    context 'with optional parameters' do

      it 'returns payment products with locale' do
        params = Integration::Util::Products::GetPaymentProductsParamsBuilder.new
                                                                             .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                             .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                             .with_locale('en_US')
                                                                             .build

        response = @products.get_payment_products(params)

        expect(response).not_to be_nil
        expect(response.payment_products).not_to be_nil
        expect(response.payment_products).not_to be_empty
        expect(response.payment_products[0]).not_to be_nil
        expect(response.payment_products[0].id).to be > 0
      end

      it 'returns payment products with amount' do
        params = Integration::Util::Products::GetPaymentProductsParamsBuilder.new
                                                                             .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                             .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                             .with_amount(1000)
                                                                             .build

        response = @products.get_payment_products(params)

        expect(response).not_to be_nil
        expect(response.payment_products).not_to be_nil
        expect(response.payment_products).not_to be_empty
        expect(response.payment_products[0]).not_to be_nil
        expect(response.payment_products[0].id).to be > 0
      end

      it 'returns payment products with is recurring' do
        params = Integration::Util::Products::GetPaymentProductsParamsBuilder.new
                                                                             .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                             .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                             .with_is_recurring(true)
                                                                             .build

        response = @products.get_payment_products(params)

        expect(response).not_to be_nil
        expect(response.payment_products).not_to be_nil
        expect(response.payment_products).not_to be_empty
        expect(response.payment_products[0]).not_to be_nil
        expect(response.payment_products[0].id).to be > 0
      end

      it 'returns payment products with add hide' do
        params = Integration::Util::Products::GetPaymentProductsParamsBuilder.new
                                                                             .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                             .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                             .with_hide('fields')
                                                                             .with_hide('accountsOnFile')
                                                                             .build

        response = @products.get_payment_products(params)

        expect(response).not_to be_nil
        expect(response.payment_products).not_to be_nil
        expect(params.hide).not_to be_nil
        expect(params.hide.size).to eq(2)
        expect(params.hide).to include('fields')
        expect(params.hide).to include('accountsOnFile')
      end

      it 'returns payment products with hide list' do
        hide_fields = %w[fields translations]

        params = Integration::Util::Products::GetPaymentProductsParamsBuilder.new
                                                                             .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                             .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                             .with_hide_list(hide_fields)
                                                                             .build

        response = @products.get_payment_products(params)

        expect(response).not_to be_nil
        expect(response.payment_products).not_to be_nil
        expect(params.hide).to eq(hide_fields)
      end

      it 'verifies get payment products params getters' do
        params = Integration::Util::Products::GetPaymentProductsParamsBuilder.new
                                                                             .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                             .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                             .with_locale('en_US')
                                                                             .with_amount(1000)
                                                                             .with_is_recurring(true)
                                                                             .build

        expect(params.country_code).to eq(PRODUCTS_COUNTRY_CODE)
        expect(params.currency_code).to eq(PRODUCTS_CURRENCY_CODE)
        expect(params.locale).to eq('en_US')
        expect(params.amount).to eq(1000)
        expect(params.is_recurring).to be true
      end

      it 'returns payment products with operation type' do
        params = Integration::Util::Products::GetPaymentProductsParamsBuilder.new
                                                                             .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                             .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                             .with_operation_type('Authorization')
                                                                             .build

        response = @products.get_payment_products(params)

        expect(response).not_to be_nil
        expect(response.payment_products).not_to be_nil
        expect(params.operation_type).to eq('Authorization')
      end
    end

    context 'with missing country code' do

      it 'raises ValidationException' do
        params = Integration::Util::Products::GetPaymentProductsParamsBuilder.new
                                                                             .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                             .build

        exception = nil
        expect { @products.get_payment_products(params) }
          .to raise_error(OnlinePayments::SDK::ValidationException) { |e| exception = e }

        expect(exception.status_code).to eq(400)
      end
    end
  end

  describe 'when getting payment product' do

    context 'with valid payment product id' do

      it 'returns payment product' do
        params = Integration::Util::Products::GetPaymentProductParamsBuilder.new
                                                                            .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                            .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                            .build

        response = @products.get_payment_product(VALID_PAYMENT_PRODUCT_ID, params)

        expect(response).not_to be_nil
        expect(response.id).to eq(VALID_PAYMENT_PRODUCT_ID)
      end

      it 'returns payment product with locale' do
        params = Integration::Util::Products::GetPaymentProductParamsBuilder.new
                                                                            .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                            .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                            .with_locale('nl_NL')
                                                                            .build

        response = @products.get_payment_product(VALID_PAYMENT_PRODUCT_ID, params)

        expect(response).not_to be_nil
        expect(response.id).to eq(VALID_PAYMENT_PRODUCT_ID)
      end

      it 'returns payment product with amount' do
        params = Integration::Util::Products::GetPaymentProductParamsBuilder.new
                                                                            .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                            .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                            .with_amount(2500)
                                                                            .build

        response = @products.get_payment_product(VALID_PAYMENT_PRODUCT_ID, params)

        expect(response).not_to be_nil
        expect(response.id).to eq(VALID_PAYMENT_PRODUCT_ID)
      end

      it 'returns payment product with is recurring' do
        params = Integration::Util::Products::GetPaymentProductParamsBuilder.new
                                                                            .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                            .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                            .with_is_recurring(false)
                                                                            .build

        response = @products.get_payment_product(VALID_PAYMENT_PRODUCT_ID, params)

        expect(response).not_to be_nil
        expect(response.id).to eq(VALID_PAYMENT_PRODUCT_ID)
      end

      it 'returns payment product with add hide' do
        params = Integration::Util::Products::GetPaymentProductParamsBuilder.new
                                                                            .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                            .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                            .with_hide('accountsOnFile')
                                                                            .build

        response = @products.get_payment_product(VALID_PAYMENT_PRODUCT_ID, params)

        expect(response).not_to be_nil
        expect(response.id).to eq(VALID_PAYMENT_PRODUCT_ID)
        expect(params.hide).not_to be_nil
        expect(params.hide.size).to eq(1)
        expect(params.hide).to include('accountsOnFile')
      end

      it 'returns payment product with hide list' do
        hide_fields = ['fields']

        params = Integration::Util::Products::GetPaymentProductParamsBuilder.new
                                                                            .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                            .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                            .with_hide_list(hide_fields)
                                                                            .build

        response = @products.get_payment_product(VALID_PAYMENT_PRODUCT_ID, params)

        expect(response).not_to be_nil
        expect(response.id).to eq(VALID_PAYMENT_PRODUCT_ID)
        expect(params.hide).to eq(hide_fields)
      end

      it 'verifies get payment product params getters' do
        params = Integration::Util::Products::GetPaymentProductParamsBuilder.new
                                                                            .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                            .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                            .with_locale('nl_NL')
                                                                            .with_amount(2500)
                                                                            .with_is_recurring(false)
                                                                            .build

        expect(params.country_code).to eq(PRODUCTS_COUNTRY_CODE)
        expect(params.currency_code).to eq(PRODUCTS_CURRENCY_CODE)
        expect(params.locale).to eq('nl_NL')
        expect(params.amount).to eq(2500)
        expect(params.is_recurring).to be false
      end

      it 'returns payment product with operation type' do
        params = Integration::Util::Products::GetPaymentProductParamsBuilder.new
                                                                            .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                            .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                            .with_operation_type('Authorization')
                                                                            .build

        response = @products.get_payment_product(VALID_PAYMENT_PRODUCT_ID, params)

        expect(response).not_to be_nil
        expect(response.id).to eq(VALID_PAYMENT_PRODUCT_ID)
        expect(params.operation_type).to eq('Authorization')
      end
    end

    context 'with invalid payment product id' do

      it 'raises ReferenceException' do
        params = Integration::Util::Products::GetPaymentProductParamsBuilder.new
                                                                            .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                            .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                            .build

        exception = nil
        expect { @products.get_payment_product(INVALID_PAYMENT_PRODUCT_ID, params) }
          .to raise_error(OnlinePayments::SDK::ReferenceException) { |e| exception = e }

        expect(exception.status_code).to eq(404)
      end
    end
  end

  describe 'when getting payment product networks' do

    context 'with valid payment product id' do

      it 'returns payment product networks' do
        params = Integration::Util::Products::GetPaymentProductNetworksParamsBuilder.new
                                                                                    .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                                    .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                                    .build

        response = @products.get_payment_product_networks(VALID_PAYMENT_PRODUCT_NETWORKS_ID, params)

        expect(response).not_to be_nil
        expect(response.networks).not_to be_nil
        expect(response.networks).not_to be_empty
        expect(response.networks[0]).not_to be_nil
      end

      it 'returns payment product networks with amount' do
        params = Integration::Util::Products::GetPaymentProductNetworksParamsBuilder.new
                                                                                    .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                                    .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                                    .with_amount(3000)
                                                                                    .build

        response = @products.get_payment_product_networks(VALID_PAYMENT_PRODUCT_NETWORKS_ID, params)

        expect(response).not_to be_nil
        expect(response.networks).not_to be_nil
      end

      it 'returns payment product networks with is recurring' do
        params = Integration::Util::Products::GetPaymentProductNetworksParamsBuilder.new
                                                                                    .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                                    .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                                    .with_is_recurring(true)
                                                                                    .build

        response = @products.get_payment_product_networks(VALID_PAYMENT_PRODUCT_NETWORKS_ID, params)

        expect(response).not_to be_nil
        expect(response.networks).not_to be_nil
      end

      it 'verifies get payment product networks params getters' do
        params = Integration::Util::Products::GetPaymentProductNetworksParamsBuilder.new
                                                                                    .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                                    .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                                    .with_amount(3000)
                                                                                    .with_is_recurring(true)
                                                                                    .build

        expect(params.country_code).to eq(PRODUCTS_COUNTRY_CODE)
        expect(params.currency_code).to eq(PRODUCTS_CURRENCY_CODE)
        expect(params.amount).to eq(3000)
        expect(params.is_recurring).to be true
      end
    end

    context 'with invalid payment product id' do

      it 'raises ReferenceException' do
        params = Integration::Util::Products::GetPaymentProductNetworksParamsBuilder.new
                                                                                    .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                                    .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                                    .build

        exception = nil
        expect { @products.get_payment_product_networks(INVALID_PAYMENT_PRODUCT_ID, params) }
          .to raise_error(OnlinePayments::SDK::ReferenceException) { |e| exception = e }

        expect(exception.status_code).to eq(404)
      end
    end
  end

  describe 'when getting product directory' do

    context 'with valid payment product id' do

      it 'returns product directory' do
        skip "Test is skipped because no payment method supports directory fot the test merchant."
        params = Integration::Util::Products::GetProductDirectoryParamsBuilder.new
                                                                              .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                              .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                              .build

        response = @products.get_product_directory(VALID_PAYMENT_PRODUCT_DIRECTORY_ID, params)

        expect(response).not_to be_nil
        expect(response.entries).not_to be_nil
        expect(response.entries).not_to be_empty
        expect(response.entries[0]).not_to be_nil
      end
    end

    context 'with invalid payment product id' do

      it 'raises ReferenceException' do
        params = Integration::Util::Products::GetProductDirectoryParamsBuilder.new
                                                                              .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                              .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                              .build

        exception = nil
        expect { @products.get_product_directory(INVALID_PAYMENT_PRODUCT_ID, params) }
          .to raise_error(OnlinePayments::SDK::ReferenceException) { |e| exception = e }

        expect(exception.status_code).to eq(404)
      end
    end

    context 'with parameter validation' do

      it 'verifies get product directory params getters' do
        params = Integration::Util::Products::GetProductDirectoryParamsBuilder.new
                                                                              .with_country_code(PRODUCTS_COUNTRY_CODE)
                                                                              .with_currency_code(PRODUCTS_CURRENCY_CODE)
                                                                              .build

        expect(params.country_code).to eq(PRODUCTS_COUNTRY_CODE)
        expect(params.currency_code).to eq(PRODUCTS_CURRENCY_CODE)
      end
    end
  end

  describe 'when creating payment product session' do

    context 'with non-existing payment product id' do

      it 'raises ApiException' do
        request = Integration::Util::Products::PaymentProductSessionRequestBuilder.new.build

        exception = nil
        expect { @products.create_payment_product_session(INVALID_PAYMENT_PRODUCT_ID, request) }
          .to raise_error(OnlinePayments::SDK::ApiException) { |e| exception = e }

        expect(exception.status_code).to eq(400)
      end
    end
  end
end
