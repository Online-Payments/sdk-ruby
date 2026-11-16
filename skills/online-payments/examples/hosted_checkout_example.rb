require 'logger'
require 'openssl'
require 'uri'
require 'onlinepayments/sdk'
require_relative 'app_types'
require_relative 'payment_status_example'

class HostedCheckoutExample
  # @param merchant [OnlinePayments::SDK::Merchant::MerchantClient]
  # @param orders [OrderStore]
  # @param public_base_url [String] absolute public base URL of your shop from your configuration
  # @param logger [Logger]
  def initialize(merchant, orders, public_base_url, logger)
    @merchant = merchant
    @orders = orders
    @public_base_url = public_base_url
    @logger = logger
    @payment_status = PaymentStatusExample.new(merchant, orders)
  end

  # [START hosted-checkout-create]
  # Returns the URL to redirect the customer to.
  # @param order_id [String]
  # @param amount_in_cents [Integer]
  # @param currency_code [String]
  # @return [String]
  def start_checkout(order_id, amount_in_cents, currency_code)
    amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
    amount_of_money.amount = amount_in_cents
    amount_of_money.currency_code = currency_code

    references = OnlinePayments::SDK::Domain::OrderReferences.new
    references.merchant_reference = order_id

    order = OnlinePayments::SDK::Domain::Order.new
    order.amount_of_money = amount_of_money
    order.references = references

    checkout_input = OnlinePayments::SDK::Domain::HostedCheckoutSpecificInput.new
    checkout_input.return_url = build_return_url(order_id)
    checkout_input.locale = 'en-GB'

    request = OnlinePayments::SDK::Domain::CreateHostedCheckoutRequest.new
    request.order = order
    request.hosted_checkout_specific_input = checkout_input

    response = create_hosted_checkout_with_retry(request)
    hosted_checkout_id = response.hosted_checkout_id
    returnmac = response.returnmac
    redirect_url = response.redirect_url
    if hosted_checkout_id.nil? || returnmac.nil? || redirect_url.nil?
      raise "Incomplete hosted checkout response for order #{order_id}"
    end

    # Store both values with the order before the customer leaves your site.
    orders.save_hosted_checkout(order_id, hosted_checkout_id, returnmac)
    # Redirect to this URL exactly as returned. Do not build it from partial_redirect_url.
    redirect_url
  end

  # The return URL comes from your configuration (an absolute public base URL), never from the Host header of the
  # request, which the sender controls. The order reference is escaped for the query string.
  # @param order_id [String]
  # @return [String]
  def build_return_url(order_id)
    "#{public_base_url}/return?#{URI.encode_www_form('orderId' => order_id)}"
  end
  # [END hosted-checkout-create]

  # [START hosted-checkout-retry]
  # CreateHostedCheckout does not support idempotent requests: the platform ignores an idempotence key, so every
  # resend creates a new session. That is harmless until the customer pays in it; the unused session expires.
  # Send it again after no answer or after an error marked retriable. The waiting happens inside the customer's
  # request, so the browser waits too: keep the attempts few and the delays short, or move the call to a
  # background job.
  # @param request [OnlinePayments::SDK::Domain::CreateHostedCheckoutRequest]
  # @return [OnlinePayments::SDK::Domain::CreateHostedCheckoutResponse]
  def create_hosted_checkout_with_retry(request)
    attempt = 1
    begin
      merchant.hosted_checkout.create_hosted_checkout(request)
    rescue OnlinePayments::SDK::ApiException => e
      # The error of a Hosted Checkout call is a plain error response, so logging it is fine here: log at least the
      # error ID, status and error codes.
      codes = e.errors.map { |error| "#{error.error_code} #{error.property_name}" }.join('; ')
      logger.error("create_hosted_checkout failed: status #{e.status_code}, error_id #{e.error_id}: #{codes}")
      # Only an error marked retriable is sent again. Other errors reach the caller.
      raise if attempt >= 3 || e.errors.none? { |error| error.retriable == true }

      sleep(attempt)
      attempt += 1
      retry
    rescue OnlinePayments::SDK::Communication::CommunicationException
      # No answer (timeout or connection error): the session may or may not exist. Send the request again.
      raise if attempt >= 3

      sleep(attempt)
      attempt += 1
      retry
    end
  end
  # [END hosted-checkout-retry]

  # [START hosted-checkout-return]
  # Called when the customer comes back on your return URL, e.g. with params['RETURNMAC'] in Sinatra or Rails.
  # @param order_id [String]
  # @param returnmac_from_query [String, nil]
  # @return [Symbol] one of the OrderPaymentState values
  def handle_return(order_id, returnmac_from_query)
    stored = orders.get_hosted_checkout(order_id)
    # The platform appends RETURNMAC to the return URL. It identifies the returning customer:
    # a missing or different value means the request does not belong to this checkout.
    if returnmac_from_query.nil? || returnmac_from_query.empty? ||
       !constant_time_equal?(stored.returnmac, returnmac_from_query)
      raise "RETURNMAC does not match the stored value for order #{order_id}"
    end

    # Never trust the redirect alone: read the result from the platform.
    begin
      hosted_checkout = merchant.hosted_checkout.get_hosted_checkout(stored.hosted_checkout_id)
    rescue OnlinePayments::SDK::ReferenceException => e
      # The API reference documents a 404 for this call. If it fails with not found, read the payment instead,
      # with the payment ID that your webhook handler stored. Without a stored payment ID
      # this returns :pending, and the webhook or your reconciliation job settles the order: do not mark it failed.
      # Other errors reach the caller, including the 409 and 410 that the SDK also raises as ReferenceException.
      raise unless e.status_code == 404

      logger.warn("get_hosted_checkout failed for order #{order_id}: status #{e.status_code}, error_id #{e.error_id}")
      return payment_status.refresh_payment_state(order_id)
    end
    payment = hosted_checkout.created_payment_output&.payment
    payment_id = payment&.id
    if hosted_checkout.status == 'PAYMENT_CREATED' && payment && payment_id
      orders.save_payment_id(order_id, payment_id)
      state = PaymentStatusExample.to_order_state(payment.status, payment.status_output)
      orders.save_state(order_id, state)
      return state
    end
    if hosted_checkout.status == 'CANCELLED_BY_CONSUMER'
      # The customer cancelled, or the session expired (the created payment is then cancelled with the error id
      # CANCELLED_BY_EXPIRATION).
      orders.save_state(order_id, OrderPaymentState::CANCELLED)
      return OrderPaymentState::CANCELLED
    end

    # IN_PROGRESS: the customer has not finished. A webhook will report the result.
    OrderPaymentState::PENDING
  end

  # Compares in constant time, so the comparison does not reveal the stored value. OpenSSL.secure_compare would do
  # this, but it does not exist on Ruby 2.3 to 2.7 (the SDK supports Ruby 2.3 and higher). Hashing both values
  # first makes them the same length, so a different length is not visible either.
  # @param expected [String]
  # @param actual [String]
  # @return [Boolean]
  def constant_time_equal?(expected, actual)
    expected_bytes = OpenSSL::Digest::SHA256.digest(expected).bytes
    actual_bytes = OpenSSL::Digest::SHA256.digest(actual).bytes
    difference = 0
    expected_bytes.each_with_index { |byte, index| difference |= byte ^ actual_bytes.fetch(index) }
    difference.zero?
  end
  # [END hosted-checkout-return]

  private

  # @return [OnlinePayments::SDK::Merchant::MerchantClient]
  attr_reader :merchant

  # @return [OrderStore]
  attr_reader :orders

  # @return [String]
  attr_reader :public_base_url

  # @return [Logger]
  attr_reader :logger

  # @return [PaymentStatusExample]
  attr_reader :payment_status
end
