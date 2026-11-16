require 'onlinepayments/sdk'
require_relative 'app_types'
require_relative 'payment_status_example'

module CreatePaymentResponseHandler
  # [START payment-response-handle]
  # Use for every create_payment response: server-to-server, Hosted Tokenization, Hosted Fields and client integration.
  # @param response [OnlinePayments::SDK::Domain::CreatePaymentResponse]
  # @param order_id [String]
  # @param orders [OrderStore]
  # @return [PaymentStep]
  def self.handle_create_payment_response(response, order_id, orders)
    payment = response.payment
    payment_id = payment&.id
    raise "The create payment response for order #{order_id} has no payment" if payment.nil? || payment_id.nil?

    orders.save_payment_id(order_id, payment_id)

    redirect_url = response.merchant_action&.redirect_data&.redirect_url
    if response.merchant_action&.action_type == 'REDIRECT' && redirect_url && !redirect_url.empty?
      # 3-D Secure challenge or a third-party page. Redirect to the URL exactly as returned.
      # The customer comes back on your return URL; then read the status with get_payment_details.
      return PaymentStep.new(redirect_url: redirect_url)
    end

    # No customer action needed: the result is already known.
    state = PaymentStatusExample.to_order_state(payment.status, payment.status_output)
    orders.save_state(order_id, state)
    PaymentStep.new(state: state)
  end
  # [END payment-response-handle]
end
