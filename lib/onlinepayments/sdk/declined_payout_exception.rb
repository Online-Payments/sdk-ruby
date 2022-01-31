require 'onlinepayments/sdk/declined_transaction_exception'

module OnlinePayments::SDK

  # Indicates that a payout is declined by the Online Payments platform or one of its downstream partners/acquirers.
  class DeclinedPayoutException < DeclinedTransactionException

    # Create a new DeclinedPayoutException
    # @see ApiException#initialize
    def initialize(status_code, response_body, errors)
      super(status_code, response_body, errors&.error_id, errors&.errors, build_message(errors))
      @errors = errors
    end

    # The declined payout result as returned by the Online Payments platform.
    # @return [OnlinePayments::SDK::Domain::PayoutResult, nil]
    def payout_result
      @errors&.payout_result
    end

    private

    def build_message(errors)
      payout = errors&.payout_result
      if payout
        "declined payout '#{payout.id}' with status '#{payout.status}'"
      else
        'the Online Payments platform returned a declined payout response'
      end
    end
  end
end
