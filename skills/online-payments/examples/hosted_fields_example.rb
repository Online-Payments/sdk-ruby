require 'onlinepayments/sdk'
require_relative 'app_types'
require_relative 'create_payment_response_handler'
require_relative 'payment_attempt'

class HostedFieldsExample
  # @param merchant [OnlinePayments::SDK::Merchant::MerchantClient]
  # @param orders [OrderStore]
  def initialize(merchant, orders)
    @merchant = merchant
    @orders = orders
  end

  # [START hosted-fields-create]
  # Creates the session that the Hosted Fields script on your checkout page needs.
  # @param checkout_page_origin [String] the origin of your checkout page, e.g. https://shop.example
  # @return [OnlinePayments::SDK::Domain::CreateHostedFieldsSessionResponse]
  def create_session(checkout_page_origin)
    request = OnlinePayments::SDK::Domain::CreateHostedFieldsSessionRequest.new
    request.locale = 'en-GB'
    request.origin = checkout_page_origin
    response = merchant.hosted_fields.create_hosted_fields_session(request)
    # Send sdk_url, sdk_sri and session_data to the page. Pass session_data on unchanged
    # (as JSON: response.session_data.to_h).
    response
  end
  # [END hosted-fields-create]

  # [START hosted-fields-payment]
  # The page calls tokenize() and tells your server the card is ready.
  # hosted_fields_session_id is hosted_fields_session_id of the create_session response; session_data.hosted_fields_session_id holds the same value.
  # @param order_id [String]
  # @param hosted_fields_session_id [String]
  # @param amount_in_cents [Integer]
  # @param currency_code [String]
  # @param device [OnlinePayments::SDK::Domain::CustomerDevice]
  # @param return_url [String]
  # @return [PaymentStep]
  def pay(order_id, hosted_fields_session_id, amount_in_cents, currency_code, device, return_url)
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
    request.hosted_fields_session_id = hosted_fields_session_id
    request.order = order
    request.card_payment_method_specific_input = card_input

    context = OnlinePayments::SDK::CallContext.new(PaymentAttempt.key_for(order_id, orders))
    response = merchant.payments.create_payment(request, context)
    CreatePaymentResponseHandler.handle_create_payment_response(response, order_id, orders)
  end
  # [END hosted-fields-payment]

  private

  # @return [OnlinePayments::SDK::Merchant::MerchantClient]
  attr_reader :merchant

  # @return [OrderStore]
  attr_reader :orders
end
