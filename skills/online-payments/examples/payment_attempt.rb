require 'securerandom'
require_relative 'app_types'

# [START payment-attempt-key]
# One idempotence key per payment attempt, stored with the order.
module PaymentAttempt
  # Call start when the customer begins to pay, for example when you show the payment form, and again before a new
  # attempt after a decline or a rejected request. It stores the key before any create_payment call.
  # @param order_id [String]
  # @param orders [OrderStore]
  # @return [String]
  def self.start(order_id, orders)
    key = SecureRandom.uuid
    orders.save_idempotence_key(order_id, key)
    key
  end

  # The request that creates the payment reads the stored key. A double submit, a retry after a timeout and a restart
  # then send the same key, so the platform does not create a second payment.
  # @param order_id [String]
  # @param orders [OrderStore]
  # @return [String]
  def self.key_for(order_id, orders)
    key = orders.get_idempotence_key(order_id)
    raise "No payment attempt was started for order #{order_id}" if key.nil?

    key
  end
end
# [END payment-attempt-key]
