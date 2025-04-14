require 'spec_helper'
require 'yaml'
require 'integration_setup'
require 'webmock/rspec'
require 'onlinepayments/sdk/merchant/productgroups/get_product_groups_params'

describe 'PaymentProductGroups' do

  before(:context) { WebMock.allow_net_connect! }
  after(:context) { WebMock.disable_net_connect! }

  it 'can be accessed' do

    params = OnlinePayments::SDK::Merchant::ProductGroups::GetProductGroupsParams.new
    params.country_code = 'NL'
    params.currency_code = 'EUR'

    Integration.init_client(false) do |client|
      response = client.merchant(Integration::MERCHANT_ID).product_groups.get_product_group('cards', params)
      expect(response).not_to be_nil
      expect(response.id).not_to be_nil
      expect(response.id.downcase).to eq('cards')
    end
  end
end
