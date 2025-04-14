require 'rspec'
require 'spec_helper'
require 'onlinepayments/sdk/merchant/products/get_payment_product_params'
require 'onlinepayments/sdk/merchant/productgroups/get_product_groups_params'

RequestParam ||= OnlinePayments::SDK::Communication::RequestParam

shared_examples_for 'GetParams' do

  it 'should output an empty list when no parameters are present' do
    expect(params.to_request_parameters).to eq([])
  end

  it 'accepts parameters' do
    expected = []
    params.amount = 1000
    expected << RequestParam.new('amount', '1000')
    params.country_code = 'NL'
    expected << RequestParam.new('countryCode', 'NL')
    params.currency_code = 'EUR'
    expected << RequestParam.new('currencyCode', 'EUR')
    params.is_recurring = true
    expected << RequestParam.new('isRecurring', 'true')
    params.locale = 'nl_NL'
    expected << RequestParam.new('locale', 'nl_NL')
    params.add_hide('fields')
    expected << RequestParam.new('hide', 'fields')
    params.add_hide('accounts_on_file')
    expected << RequestParam.new('hide', 'accounts_on_file')

    expect(params.to_request_parameters).to match_array(expected)
  end

  it 'allows for deletion' do
    params.amount = 1000
    params.country_code = 'NL'
    params.currency_code = 'EUR'
    params.amount = nil
    params.country_code = nil
    params.currency_code = nil

    expect(params.to_request_parameters).to eq([])
  end
end

GetPaymentProductParams ||= OnlinePayments::SDK::Merchant::Products::GetPaymentProductParams
GetProductGroupParams ||= OnlinePayments::SDK::Merchant::ProductGroups::GetProductGroupsParams

describe GetPaymentProductParams do
  let(:params) { GetPaymentProductParams.new }

  it_behaves_like 'GetParams'
end

describe GetProductGroupParams do
  let(:params) { GetProductGroupParams.new }

  it_behaves_like 'GetParams'
end
