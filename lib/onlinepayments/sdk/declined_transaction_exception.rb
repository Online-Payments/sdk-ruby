module OnlinePayments::SDK

  # Indicates that a transaction is declined by the Online Payments platform or one of its downstream partners/acquirers.
  class DeclinedTransactionException < ApiException

    # Create a new DeclinedTransactionException.
    # @see ApiException#initialize
    def initialize(status_code, response_body, error_id, errors, message = nil)
      if message
        super(status_code, response_body, error_id, errors, message)
      else
        super(status_code, response_body, error_id, errors)
      end
    end
  end
end
