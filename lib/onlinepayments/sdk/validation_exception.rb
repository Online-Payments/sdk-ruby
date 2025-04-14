#
# This file was automatically generated.
#
require_relative 'api_exception'

module OnlinePayments
  module SDK
    # Represents an error response from the payment platform when validation of requests failed.
    class ValidationException < ApiException

      # Create a new ValidationException.
      # @see ApiException#initialize
      def initialize(status_code, response_body, error_id, errors,
                     message='the payment platform returned an incorrect request error response')
        super(status_code, response_body, error_id, errors, message)
      end
    end
  end
end
