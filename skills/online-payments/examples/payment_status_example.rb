require 'onlinepayments/sdk'
require_relative 'app_types'

class PaymentStatusExample
  # @param merchant [OnlinePayments::SDK::Merchant::MerchantClient]
  # @param orders [OrderStore]
  def initialize(merchant, orders)
    @merchant = merchant
    @orders = orders
  end

  # [START payment-status]
  # @param order_id [String]
  # @return [Symbol] one of the OrderPaymentState values
  def refresh_payment_state(order_id)
    payment_id = orders.get_payment_id(order_id)
    # No payment ID stored yet: the webhook or your reconciliation job will settle the order.
    return OrderPaymentState::PENDING if payment_id.nil?

    details = merchant.payments.get_payment_details(payment_id)
    state = PaymentStatusExample.to_order_state(details.status, details.status_output)
    orders.save_state(order_id, state)
    state
  end

  # Decide on status_category. status and status_code give more detail.
  # status_output or status_category can be missing in a response: that is pending, never paid.
  # @param status [String, nil]
  # @param status_output [OnlinePayments::SDK::Domain::PaymentStatusOutput, nil]
  # @return [Symbol] one of the OrderPaymentState values
  def self.to_order_state(status, status_output)
    case status_output&.status_category
    when 'COMPLETED'
      OrderPaymentState::PAID
    when 'PENDING_MERCHANT'
      # PENDING_CAPTURE: authorized but not captured yet, capture or cancel it.
      # Any other status (CANCELLED, waiting for its final result) is not final.
      status == 'PENDING_CAPTURE' ? OrderPaymentState::AUTHORIZED : OrderPaymentState::PENDING
    when 'REFUNDED'
      OrderPaymentState::REFUNDED
    when 'REVERSED'
      # Not paid: do not treat the order as paid.
      OrderPaymentState::REVERSED
    when 'UNSUCCESSFUL'
      status == 'CANCELLED' ? OrderPaymentState::CANCELLED : OrderPaymentState::FAILED
    else
      # CREATED, PENDING_PAYMENT, PENDING_CONNECT_OR_3RD_PARTY: not final.
      # A missing status_output or status_category (nil) and categories added later also end up here: not paid.
      # Wait for a webhook or check again later.
      OrderPaymentState::PENDING
    end
  end
  # [END payment-status]

  private

  # @return [OnlinePayments::SDK::Merchant::MerchantClient]
  attr_reader :merchant

  # @return [OrderStore]
  attr_reader :orders
end
