#
# This file was automatically generated.
#
require_relative 'api_exception'

module OnlinePayments
  module SDK
    # Represents an error response from a create payment, payout or refund call.
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
end
