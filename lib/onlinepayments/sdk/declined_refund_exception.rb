#
# This file was automatically generated.
#
require_relative 'declined_transaction_exception'

module OnlinePayments
  module SDK
    # Represents an error response from a refund call.
    class DeclinedRefundException < DeclinedTransactionException

      # Create a new DeclinedRefundException.
      # @see ApiException#initialize
      def initialize(status_code, response_body, response)
        super(status_code, response_body, response&.error_id, response&.errors, build_message(response))
        @response = response
      end

      # The result of creating a refund
      # @return [OnlinePayments::SDK::Domain::RefundResponse, nil]
      def refund_result
        @response&.refund_result
      end

      private

      # @param response [OnlinePayments::SDK::Domain::RefundErrorResponse, nil]
      def build_message(response)
        refund_result = response&.refund_result
        if refund_result.nil?
          'the payment platform returned a declined refund response'
        else
          "declined refund '#{refund_result.id}' with status '#{refund_result.status}'"
        end
      end
    end
  end
end
