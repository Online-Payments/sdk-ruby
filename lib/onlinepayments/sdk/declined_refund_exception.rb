require 'onlinepayments/sdk/declined_transaction_exception'

module OnlinePayments::SDK

  # Indicates that a refund is declined by the Online Payments platform or one of its downstream partners/acquirers.
  class DeclinedRefundException < DeclinedTransactionException

    # Create a new DeclinedRefundException
    # @see ApiException#initialize
    def initialize(status_code, response_body, errors)
      super(status_code, response_body, errors&.error_id, errors&.errors, build_message(errors))
      @errors = errors
    end

    # The declined refund result as returned by the Online Payments platform.
    # @return [OnlinePayments::SDK::Domain::RefundResult, nil]
    def refund_result
      @errors&.refund_result
    end

    private

    def build_message(errors)
      refund = errors&.refund_result
      if refund
        "declined refund '#{refund.id}' with status '#{refund.status}'"
      else
        'the Online Payments platform returned a declined refund response'
      end
    end
  end
end
