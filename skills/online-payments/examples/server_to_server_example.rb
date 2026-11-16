require 'onlinepayments/sdk'
require_relative 'app_types'
require_relative 'create_payment_response_handler'
require_relative 'payment_attempt'

class ServerToServerExample
  # @param merchant [OnlinePayments::SDK::Merchant::MerchantClient]
  # @param orders [OrderStore]
  def initialize(merchant, orders)
    @merchant = merchant
    @orders = orders
  end

  # [START server-to-server-create]
  # Card data on your server puts you in scope of PCI DSS SAQ D.
  # Use Hosted Tokenization or Hosted Fields unless you are certified for it.
  # @param order_id [String]
  # @param amount_in_cents [Integer]
  # @param currency_code [String]
  # @param payment_product_id [Integer] e.g. 1 = Visa, 3 = Mastercard.
  # @param card [CardInput]
  # @param device [OnlinePayments::SDK::Domain::CustomerDevice]
  # @param return_url [String]
  # @return [PaymentStep]
  def pay_with_card(order_id, amount_in_cents, currency_code, payment_product_id, card, device, return_url)
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

    card_data = OnlinePayments::SDK::Domain::Card.new
    card_data.card_number = card.number
    card_data.cardholder_name = card.holder_name
    card_data.expiry_date = card.expiry_date
    card_data.cvv = card.cvv

    redirection_data = OnlinePayments::SDK::Domain::RedirectionData.new
    redirection_data.return_url = return_url
    three_d_secure = OnlinePayments::SDK::Domain::ThreeDSecure.new
    three_d_secure.redirection_data = redirection_data

    card_input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInput.new
    card_input.payment_product_id = payment_product_id
    card_input.card = card_data
    # SALE: authorised and captured at once. Acquirers that do not support it ignore it.
    # FINAL_AUTHORIZATION: capture the full amount within 7 days.
    # PRE_AUTHORIZATION: can be reversed; capture the authorised amount or less within 30 days.
    card_input.authorization_mode = 'SALE'
    card_input.three_d_secure = three_d_secure

    request = OnlinePayments::SDK::Domain::CreatePaymentRequest.new
    request.order = order
    request.card_payment_method_specific_input = card_input

    # The idempotence key is a positional argument.
    context = OnlinePayments::SDK::CallContext.new(PaymentAttempt.key_for(order_id, orders))
    # Raises DeclinedPaymentException if the payment is declined, and other ApiException subclasses for errors;
    # see ErrorHandlingExample for handling each case.
    response = merchant.payments.create_payment(request, context)
    CreatePaymentResponseHandler.handle_create_payment_response(response, order_id, orders)
  end
  # [END server-to-server-create]

  private

  # @return [OnlinePayments::SDK::Merchant::MerchantClient]
  attr_reader :merchant

  # @return [OrderStore]
  attr_reader :orders
end
