require 'spec_helper'
require 'integration_setup'
require 'securerandom'
require 'webmock/rspec'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/address'
require 'onlinepayments/sdk/domain/create_payment_request'
require 'onlinepayments/sdk/domain/customer'
require 'onlinepayments/sdk/domain/order'
require 'onlinepayments/sdk/domain/redirect_payment_product809_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_method_specific_input'
require 'onlinepayments/sdk/call_context'

describe 'Idempotence with the server' do

  before(:context) { WebMock.allow_net_connect! }
  after(:context) { WebMock.disable_net_connect! }

  it 'realises when an idempotent request is sent twice' do
    amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
    amount_of_money.currency_code = 'EUR'
    amount_of_money.amount = 100
    billing_address = OnlinePayments::SDK::Domain::Address.new
    billing_address.country_code = 'NL'
    customer = OnlinePayments::SDK::Domain::Customer.new
    customer.locale = 'en'
    customer.billing_address = billing_address
    order = OnlinePayments::SDK::Domain::Order.new
    order.amount_of_money = amount_of_money
    order.customer = customer

    card = OnlinePayments::SDK::Domain::Card.new
    card.card_number = "4567350000427977"
    card.cardholder_name = "Wile E. Coyote"
    card.cvv = "123"
    card.expiry_date = "1230";

    redirection_data = OnlinePayments::SDK::Domain::RedirectionData.new
    redirection_data.return_url = "https://hostname.myownwebsite.url"

    three_d_secure = OnlinePayments::SDK::Domain::ThreeDSecure.new
    three_d_secure.challenge_canvas_size = ("600x400")
    three_d_secure.challenge_indicator = "challenge-requested"
    three_d_secure.redirection_data = redirection_data
    three_d_secure.skip_authentication = false

    card_payment_method_specific_input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInput.new
    card_payment_method_specific_input.card = card
    card_payment_method_specific_input.is_recurring = false
    card_payment_method_specific_input.payment_product_id = 1
    card_payment_method_specific_input.three_d_secure = three_d_secure
    card_payment_method_specific_input.transaction_channel = "ECOMMERCE"

    body = OnlinePayments::SDK::Domain::CreatePaymentRequest.new
    body.order = order
    body.redirect_payment_method_specific_input = card_payment_method_specific_input
    idempotence_key = SecureRandom.uuid
    context = OnlinePayments::SDK::CallContext.new(idempotence_key)

    Integration.init_client(false) do |client|
      response = client.merchant(Integration::MERCHANT_ID).payments.create_payment(body, context)
      payment_id = response.payment.id

      expect(payment_id).to_not be_nil
      expect(context.idempotence_key).to eq(idempotence_key)
      expect(context.idempotence_request_timestamp).to be_nil

      response_2 = client.merchant(Integration::MERCHANT_ID).payments.create_payment(body, context)
      payment_id2 = response_2.payment.id

      expect(payment_id).to eq(payment_id2)
      expect(context.idempotence_key).to eq(idempotence_key)
      expect(context.idempotence_request_timestamp).to_not be_nil
    end
  end
end
