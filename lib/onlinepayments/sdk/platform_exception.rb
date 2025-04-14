#
# This file was automatically generated.
#
require_relative 'api_exception'

module OnlinePayments
  module SDK
    # Represents an error response from the payment platform when something went wrong at the payment platform or further downstream.
    class PlatformException < ApiException

      # Create a new PlatformException.
      # @see ApiException#initialize
      def initialize(status_code, response_body, error_id, errors,
                     message='the payment platform returned an error response')
        super(status_code, response_body, error_id, errors, message)
      end
    end
  end
end
