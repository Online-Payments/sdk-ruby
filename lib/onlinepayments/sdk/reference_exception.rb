#
# This file was automatically generated.
#
require_relative 'api_exception'

module OnlinePayments
  module SDK
    # Represents an error response from the payment platform when a non-existing or removed object is trying to be accessed.
    class ReferenceException < ApiException

      # Create a new ReferenceException.
      # @see ApiException#initialize
      def initialize(status_code, response_body, error_id, errors,
                     message='the payment platform returned a reference error response')
        super(status_code, response_body, error_id, errors, message)
      end
    end
  end
end
