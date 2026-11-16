require 'onlinepayments/sdk'
require_relative 'app_types'
require_relative 'create_payment_response_handler'
require_relative 'payment_attempt'

class HostedTokenizationExample
  # @param merchant [OnlinePayments::SDK::Merchant::MerchantClient]
  # @param orders [OrderStore]
  def initialize(merchant, orders)
    @merchant = merchant
    @orders = orders
  end

  # [START hosted-tokenization-create]
  # Creates the session for the card form iframe on your checkout page.
  # @return [OnlinePayments::SDK::Domain::CreateHostedTokenizationResponse]
  def create_session
    request = OnlinePayments::SDK::Domain::CreateHostedTokenizationRequest.new
    request.locale = 'en-GB'
    # Optional: request.variant = 'MyTemplate.html', the file name of a custom template.
    response = merchant.hosted_tokenization.create_hosted_tokenization(request)
    # Send hosted_tokenization_url (iframe URL) and sri (script integrity) to the page.
    response
  end
  # [END hosted-tokenization-create]

  # [START hosted-tokenization-payment]
  # The page calls tokenizer.submitTokenization() and posts result.hostedTokenizationId to your server.
  # @param order_id [String]
  # @param hosted_tokenization_id [String]
  # @param amount_in_cents [Integer]
  # @param currency_code [String]
  # @param device [OnlinePayments::SDK::Domain::CustomerDevice]
  # @param return_url [String]
  # @return [PaymentStep]
  def pay(order_id, hosted_tokenization_id, amount_in_cents, currency_code, device, return_url)
    amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
    amount_of_money.amount = amount_in_cents
    amount_of_money.currency_code = currency_code

    references = OnlinePayments::SDK::Domain::OrderReferences.new
    references.merchant_reference = order_id

    customer = OnlinePayments::SDK::Domain::Customer.new
    customer.device = device

    order = OnlinePayments::SDK::Domain::Order.new
    order.amount_of_money = amount_of_money
    order.references = references
    order.customer = customer

    redirection_data = OnlinePayments::SDK::Domain::RedirectionData.new
    redirection_data.return_url = return_url
    three_d_secure = OnlinePayments::SDK::Domain::ThreeDSecure.new
    three_d_secure.redirection_data = redirection_data

    card_input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInput.new
    card_input.authorization_mode = 'SALE'
    card_input.three_d_secure = three_d_secure

    request = OnlinePayments::SDK::Domain::CreatePaymentRequest.new
    request.hosted_tokenization_id = hosted_tokenization_id
    request.order = order
    request.card_payment_method_specific_input = card_input

    context = OnlinePayments::SDK::CallContext.new(PaymentAttempt.key_for(order_id, orders))
    response = merchant.payments.create_payment(request, context)
    CreatePaymentResponseHandler.handle_create_payment_response(response, order_id, orders)
  end
  # [END hosted-tokenization-payment]

  private

  # @return [OnlinePayments::SDK::Merchant::MerchantClient]
  attr_reader :merchant

  # @return [OrderStore]
  attr_reader :orders
end
