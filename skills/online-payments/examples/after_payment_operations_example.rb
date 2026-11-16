require 'onlinepayments/sdk'

# Each method takes an idempotence key. Create it once per operation (e.g. when someone clicks "Refund") and store it.
# Pass the same key again if the request got no answer; see ErrorHandlingExample.
class AfterPaymentOperationsExample
  # @param merchant [OnlinePayments::SDK::Merchant::MerchantClient]
  def initialize(merchant)
    @merchant = merchant
  end

  # [START capture-payment]
  # Captures an authorized payment (status PENDING_CAPTURE). Without an amount, the full amount is captured.
  # @param payment_id [String]
  # @param amount_in_cents [Integer]
  # @param is_final [Boolean] true: this capture is final, no further capture is accepted.
  # @param idempotence_key [String]
  # @return [OnlinePayments::SDK::Domain::CaptureResponse]
  def capture(payment_id, amount_in_cents, is_final, idempotence_key)
    details = merchant.payments.get_payment_details(payment_id)
    raise "Payment #{payment_id} cannot be captured in status #{details.status}" if details.status != 'PENDING_CAPTURE'

    request = OnlinePayments::SDK::Domain::CapturePaymentRequest.new
    request.amount = amount_in_cents
    request.is_final = is_final
    context = OnlinePayments::SDK::CallContext.new(idempotence_key)
    merchant.payments.capture_payment(payment_id, request, context)
  end
  # [END capture-payment]

  # [START refund-payment]
  # Refunds a captured payment, fully or partly.
  # @param payment_id [String]
  # @param amount_in_cents [Integer]
  # @param currency_code [String]
  # @param idempotence_key [String]
  # @return [OnlinePayments::SDK::Domain::RefundResponse]
  def refund(payment_id, amount_in_cents, currency_code, idempotence_key)
    details = merchant.payments.get_payment_details(payment_id)
    unless details.status_output&.is_refundable == true
      raise "Payment #{payment_id} is not refundable in status #{details.status}"
    end

    amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
    amount_of_money.amount = amount_in_cents
    amount_of_money.currency_code = currency_code
    request = OnlinePayments::SDK::Domain::RefundRequest.new
    request.amount_of_money = amount_of_money
    context = OnlinePayments::SDK::CallContext.new(idempotence_key)
    # REFUND_REQUESTED: the platform is processing the refund and waiting for the result. The status then becomes
    # REFUNDED or REJECTED; treat the refund as done only when it is REFUNDED.
    merchant.payments.refund_payment(payment_id, request, context)
  end
  # [END refund-payment]

  # [START cancel-payment]
  # Cancels (voids) an authorization that is not captured yet. No amount cancels the full amount.
  # @param payment_id [String]
  # @param idempotence_key [String]
  # @return [OnlinePayments::SDK::Domain::CancelPaymentResponse]
  def cancel(payment_id, idempotence_key)
    details = merchant.payments.get_payment_details(payment_id)
    unless details.status_output&.is_cancellable == true
      raise "Payment #{payment_id} is not cancellable in status #{details.status}"
    end

    context = OnlinePayments::SDK::CallContext.new(idempotence_key)
    merchant.payments.cancel_payment(payment_id, OnlinePayments::SDK::Domain::CancelPaymentRequest.new, context)
  end
  # [END cancel-payment]

  private

  # @return [OnlinePayments::SDK::Merchant::MerchantClient]
  attr_reader :merchant
end
