#
# This file was automatically generated.
#
require_relative 'declined_transaction_exception'

module OnlinePayments
  module SDK
    # Represents an error response from a payout call.
    class DeclinedPayoutException < DeclinedTransactionException

      # Create a new DeclinedPayoutException.
      # @see ApiException#initialize
      def initialize(status_code, response_body, response)
        super(status_code, response_body, response&.error_id, response&.errors, build_message(response))
        @response = response
      end

      # The result of creating a payout
      # @return [OnlinePayments::SDK::Domain::PayoutResult, nil]
      def payout_result
        @response&.payout_result
      end

      private

      # @param response [OnlinePayments::SDK::Domain::PayoutErrorResponse, nil]
      def build_message(response)
        payout_result = response&.payout_result
        if payout_result.nil?
          'the payment platform returned a declined payout response'
        else
          "declined payout '#{payout_result.id}' with status '#{payout_result.status}'"
        end
      end
    end
  end
end
