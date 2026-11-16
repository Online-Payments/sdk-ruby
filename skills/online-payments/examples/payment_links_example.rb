require 'date'
require 'onlinepayments/sdk'

class PaymentLinksExample
  # @param merchant [OnlinePayments::SDK::Merchant::MerchantClient]
  def initialize(merchant)
    @merchant = merchant
  end

  # [START payment-link-create]
  # Returns the link to send to the customer (email, chat, invoice).
  # @param order_id [String]
  # @param amount_in_cents [Integer]
  # @param currency_code [String]
  # @param description [String]
  # @return [OnlinePayments::SDK::Domain::PaymentLinkResponse]
  def create_link(order_id, amount_in_cents, currency_code, description)
    amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
    amount_of_money.amount = amount_in_cents
    amount_of_money.currency_code = currency_code

    references = OnlinePayments::SDK::Domain::OrderReferences.new
    references.merchant_reference = order_id

    order = OnlinePayments::SDK::Domain::Order.new
    order.amount_of_money = amount_of_money
    order.references = references

    link_input = OnlinePayments::SDK::Domain::PaymentLinkSpecificInput.new
    link_input.description = description
    # Required. A DateTime (not a Time), at most 6 months in the future.
    link_input.expiration_date = (Time.now + (7 * 24 * 60 * 60)).to_datetime

    request = OnlinePayments::SDK::Domain::CreatePaymentLinkRequest.new
    request.order = order
    request.payment_link_specific_input = link_input

    # CreatePaymentLink does not support idempotent requests, so no idempotence key is sent.
    link = merchant.payment_links.create_payment_link(request)
    # Store payment_link_id with the order. Send redirection_url exactly as returned.
    # The paymentlink.paid webhook (or get_payment_link_by_id) tells you when it is paid.
    # Once paid, the link's payment_id has no attempt suffix: use it with "_0" appended in
    # GetPaymentDetails, and read the payment's status.
    link
  end
  # [END payment-link-create]

  private

  # @return [OnlinePayments::SDK::Merchant::MerchantClient]
  attr_reader :merchant
end
