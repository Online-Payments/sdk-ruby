require 'onlinepayments/sdk'
require_relative 'app_types'
require_relative 'hosted_checkout_example'
require_relative 'payment_status_example'

class RecurringPaymentsExample
  # @param merchant [OnlinePayments::SDK::Merchant::MerchantClient]
  # @param orders [OrderStore]
  # @param hosted_checkout [HostedCheckoutExample] provides the return URL and the create call with retries
  def initialize(merchant, orders, hosted_checkout)
    @merchant = merchant
    @orders = orders
    @hosted_checkout = hosted_checkout
  end

  # [START recurring-first]
  # First payment of a subscription, made by the customer on the Hosted Checkout Page.
  # The recurring flag marks it as the first payment of the series.
  # It follows the Hosted Checkout flow: the return URL is built from your configuration and the call goes through
  # the same retry helper. Handle the return as there.
  # @param order_id [String]
  # @param amount_in_cents [Integer]
  # @param currency_code [String]
  # @return [String] the URL to redirect the customer to
  def start_subscription(order_id, amount_in_cents, currency_code)
    amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
    amount_of_money.amount = amount_in_cents
    amount_of_money.currency_code = currency_code

    references = OnlinePayments::SDK::Domain::OrderReferences.new
    references.merchant_reference = order_id

    order = OnlinePayments::SDK::Domain::Order.new
    order.amount_of_money = amount_of_money
    order.references = references

    checkout_input = OnlinePayments::SDK::Domain::HostedCheckoutSpecificInput.new
    # The return URL is built from your configured public base URL, as in the Hosted Checkout flow.
    checkout_input.return_url = hosted_checkout.build_return_url(order_id)
    checkout_input.is_recurring = true

    request = OnlinePayments::SDK::Domain::CreateHostedCheckoutRequest.new
    request.order = order
    request.hosted_checkout_specific_input = checkout_input

    response = hosted_checkout.create_hosted_checkout_with_retry(request)
    hosted_checkout_id = response.hosted_checkout_id
    returnmac = response.returnmac
    redirect_url = response.redirect_url
    if hosted_checkout_id.nil? || returnmac.nil? || redirect_url.nil?
      raise "Incomplete hosted checkout response for order #{order_id}"
    end

    orders.save_hosted_checkout(order_id, hosted_checkout_id, returnmac)
    redirect_url
  end

  # When the first payment is authorised or captured, keep its payment ID: later charges refer to it.
  # @param customer_id [String]
  # @param first_payment_id [String]
  # @return [void]
  def on_first_payment_succeeded(customer_id, first_payment_id)
    orders.save_recurring_payment_id(customer_id, first_payment_id)
  end
  # [END recurring-first]

  # [START recurring-subsequent]
  # Later charge started by you, without the customer (merchant-initiated).
  # The caller creates ONE idempotence key per charge and stores it with the charge (orders.save_idempotence_key)
  # before the first call. Retries of the same charge reuse that key; the rules are in the error handling example.
  # @param customer_id [String]
  # @param order_id [String]
  # @param amount_in_cents [Integer]
  # @param currency_code [String]
  # @param idempotence_key [String]
  # @return [Symbol] one of the OrderPaymentState values
  def charge_renewal(customer_id, order_id, amount_in_cents, currency_code, idempotence_key)
    first_payment_id = orders.get_recurring_payment_id(customer_id)

    amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
    amount_of_money.amount = amount_in_cents
    amount_of_money.currency_code = currency_code

    references = OnlinePayments::SDK::Domain::OrderReferences.new
    references.merchant_reference = order_id

    order = OnlinePayments::SDK::Domain::Order.new
    order.amount_of_money = amount_of_money
    order.references = references

    card_input = OnlinePayments::SDK::Domain::SubsequentCardPaymentMethodSpecificInput.new
    # Recurring = fixed amount, regular intervals (at most one year), started by you.
    # Other allowed values: Unscheduled, Installment, NoShow, DelayedCharge, PartialShipment,
    # Resubmission, RecurringVariable, UnscheduledFixed.
    card_input.subsequent_type = 'Recurring'
    # SALE: authorised and captured at once. Acquirers that do not support it ignore it.
    card_input.authorization_mode = 'SALE'

    request = OnlinePayments::SDK::Domain::SubsequentPaymentRequest.new
    request.order = order
    request.subsequentcard_payment_method_specific_input = card_input

    context = OnlinePayments::SDK::CallContext.new(idempotence_key)
    # A declined charge raises DeclinedPaymentException, as for create_payment.
    response = merchant.subsequent.subsequent_payment(first_payment_id, request, context)
    payment = response.payment
    payment_id = payment&.id
    raise "The subsequent payment response for order #{order_id} has no payment" if payment.nil? || payment_id.nil?

    orders.save_payment_id(order_id, payment_id)
    state = PaymentStatusExample.to_order_state(payment.status, payment.status_output)
    orders.save_state(order_id, state)
    state
  end
  # [END recurring-subsequent]

  private

  # @return [OnlinePayments::SDK::Merchant::MerchantClient]
  attr_reader :merchant

  # @return [OrderStore]
  attr_reader :orders

  # @return [HostedCheckoutExample]
  attr_reader :hosted_checkout
end
