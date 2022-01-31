require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'
require 'onlinepayments/sdk/merchant/products/get_payment_products_params'
require 'onlinepayments/sdk/merchant/products/get_payment_product_params'

describe 'PaymentProducts' do

  before(:context) { WebMock.allow_net_connect! }
  after(:context) { WebMock.disable_net_connect! }

  it 'can be accessed' do

    params = OnlinePayments::SDK::Merchant::Products::GetPaymentProductsParams.new
    params.country_code = 'NL'
    params.currency_code = 'EUR'

    Integration.init_client(false) do |client|
      response = client.merchant(Integration::MERCHANT_ID).products.get_payment_products(params)
      expect(response.payment_products.length).to be > 0
    end
  end

  it 'has directories that can be accessed' do

    params = OnlinePayments::SDK::Merchant::Products::GetPaymentProductParams.new
    params.country_code = 'NL'
    params.currency_code = 'EUR'

    Integration.init_client(false) do |client|
      response = client.merchant(Integration::MERCHANT_ID).products.get_payment_product(1, params)
      expect(response.id).to be 1
    end
  end
end
