module OnlinePayments::SDK

  # Indicates that a payment is declined by the Online Payments platform or one of its downstream partners/acquirers.
  class DeclinedPaymentException < DeclinedTransactionException

    # Create a new DeclinedPaymentException.
    # @see ApiException#initialize
    def initialize(status_code, response_body, errors)
      super(status_code, response_body, errors&.error_id, errors&.errors, build_message(errors))
      @errors = errors
    end

    # The declined payment result returned by the Online Payments platform.
    # @return [OnlinePayments::SDK::Domain::CreatePaymentResult, nil]
    def payment_result
      @errors&.payment_result
    end

    private

    def build_message(errors)
      payment = errors&.payment_result&.payment
      if payment
        "declined payment '#{payment.id}' with status '#{payment.status}'"
      else
        'the Online Payments platform returned a declined payment response'
      end
    end
  end
end
