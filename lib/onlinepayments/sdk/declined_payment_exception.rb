#
# This file was automatically generated.
#
require_relative 'declined_transaction_exception'

module OnlinePayments
  module SDK
    # Represents an error response from a create payment call.
    class DeclinedPaymentException < DeclinedTransactionException

      # Create a new DeclinedPaymentException.
      # @see ApiException#initialize
      def initialize(status_code, response_body, response)
        super(status_code, response_body, response&.error_id, response&.errors, build_message(response))
        @response = response
      end

      # The result of creating a payment
      # @return [OnlinePayments::SDK::Domain::CreatePaymentResponse, nil]
      def payment_result
        @response&.payment_result
      end

      private

      # @param response [OnlinePayments::SDK::Domain::PaymentErrorResponse, nil]
      def build_message(response)
        payment = response&.payment_result&.payment
        if payment.nil?
          'the payment platform returned a declined payment response'
        else
          "declined payment '#{payment.id}' with status '#{payment.status}'"
        end
      end
    end
  end
end
