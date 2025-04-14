#
# This file was automatically generated.
#
require_relative 'api_exception'

module OnlinePayments
  module SDK
    # Represents an error response from the payment platform when authorization failed.
    class AuthorizationException < ApiException

      # Create a new AuthorizationException.
      # @see ApiException#initialize
      def initialize(status_code, response_body, error_id, errors,
                     message='the payment platform returned an authorization error response')
        super(status_code, response_body, error_id, errors, message)
      end
    end
  end
end
