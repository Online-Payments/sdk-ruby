require 'logger'
require 'onlinepayments/sdk'
require_relative 'app_types'
require_relative 'create_payment_response_handler'
require_relative 'payment_attempt'
require_relative 'payment_status_example'

class ErrorHandlingExample
  # @param merchant [OnlinePayments::SDK::Merchant::MerchantClient]
  # @param orders [OrderStore]
  # @param logger [Logger]
  def initialize(merchant, orders, logger)
    @merchant = merchant
    @orders = orders
    @logger = logger
  end

  # [START error-handling]
  # idempotence_key is the stored key of the payment attempt (PaymentAttempt.key_for). Reuse it when a request
  # got no answer; replace it, stored again, only when the platform answered with an error marked retriable.
  # @param order_id [String]
  # @param request [OnlinePayments::SDK::Domain::CreatePaymentRequest]
  # @param idempotence_key [String]
  # @return [PaymentStep]
  def create_payment(order_id, request, idempotence_key)
    context = OnlinePayments::SDK::CallContext.new(idempotence_key)
    attempt = 1
    begin
      response = merchant.payments.create_payment(request, context)
    rescue OnlinePayments::SDK::DeclinedPaymentException => e
      # Declined: the payment exists. Read its status before deciding anything.
      return handle_declined(order_id, e)
    rescue OnlinePayments::SDK::IdempotenceException
      # The first request with this key is still running. Wait, then send the same request again.
      raise if attempt >= 3

      sleep(2 * attempt)
      attempt += 1
      retry
    rescue OnlinePayments::SDK::ValidationException => e
      # 400: the request is invalid. Fix the request; retrying does not help.
      # Log the error codes and the error ID, never the request (it can hold card data).
      codes = e.errors.map { |error| "#{error.error_code} #{error.property_name}" }.join('; ')
      logger.error("create_payment rejected, error_id #{e.error_id}: #{codes}")
      raise
    rescue OnlinePayments::SDK::ApiException => e
      # A technical error marked retriable (e.g. PlatformException, 500, 502 or 503): the request was not
      # processed. Send it again with a new key. Other errors are not retried: AuthorizationException
      # (403) for a wrong API key, secret or merchant ID, ReferenceException (404, 409,
      # 410) for an object not found, and server errors without a retriable error.
      raise if attempt >= 3 || e.errors.none? { |error| error.retriable == true }

      # The new key is stored before the call, like the first one.
      context = OnlinePayments::SDK::CallContext.new(PaymentAttempt.start(order_id, orders))
      sleep(2 * attempt)
      attempt += 1
      retry
    rescue OnlinePayments::SDK::Communication::CommunicationException
      # No answer: timeout or connection error. The payment may or may not exist.
      # Retry with the same key; the platform returns the original result instead of creating a second
      # payment.
      raise if attempt >= 3

      sleep(2 * attempt)
      attempt += 1
      retry
    end
    CreatePaymentResponseHandler.handle_create_payment_response(response, order_id, orders)
  end

  private

  # @param order_id [String]
  # @param e [OnlinePayments::SDK::DeclinedPaymentException]
  # @return [PaymentStep]
  def handle_declined(order_id, e)
    payment_id = e.payment_result&.payment&.id
    if payment_id.nil?
      orders.save_state(order_id, OrderPaymentState::FAILED)
      return PaymentStep.new(state: OrderPaymentState::FAILED)
    end

    orders.save_payment_id(order_id, payment_id)
    details = merchant.payments.get_payment_details(payment_id)
    state = PaymentStatusExample.to_order_state(details.status, details.status_output)
    orders.save_state(order_id, state)
    PaymentStep.new(state: state)
  end
  # [END error-handling]

  # @return [OnlinePayments::SDK::Merchant::MerchantClient]
  attr_reader :merchant

  # @return [OrderStore]
  attr_reader :orders

  # @return [Logger]
  attr_reader :logger
end
