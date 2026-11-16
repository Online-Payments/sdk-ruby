require 'onlinepayments/sdk'
require_relative 'app_types'
require_relative 'payment_status_example'

class WebhookEventProcessor
  # @param merchant [OnlinePayments::SDK::Merchant::MerchantClient]
  # @param orders [OrderStore]
  def initialize(merchant, orders)
    @merchant = merchant
    @orders = orders
  end

  # [START webhooks-process]
  # Runs in the background. Events can arrive twice and out of order, so read the current
  # status instead of trusting the event; repeating this is harmless.
  # @param webhooks_event [OnlinePayments::SDK::Webhooks::WebhooksEvent]
  # @return [void]
  def process(webhooks_event)
    payment = webhooks_event.payment
    payment_id = payment&.id
    # Refund, payment link, payout and token events carry other objects, e.g. webhooks_event.refund.
    return if payment.nil? || payment_id.nil?

    order_id = payment.payment_output&.references&.merchant_reference
    return if order_id.nil? || order_id.empty?

    details = merchant.payments.get_payment_details(payment_id)
    orders.save_payment_id(order_id, details.id || payment_id)
    orders.save_state(order_id, PaymentStatusExample.to_order_state(details.status, details.status_output))
  end
  # [END webhooks-process]

  private

  # @return [OnlinePayments::SDK::Merchant::MerchantClient]
  attr_reader :merchant

  # @return [OrderStore]
  attr_reader :orders
end
