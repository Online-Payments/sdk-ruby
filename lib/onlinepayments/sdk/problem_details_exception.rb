#
# This file was automatically generated.
#
require_relative 'api_exception'

module OnlinePayments
  module SDK
    # Represents an error response from the payment platform containing problem details.
    class ProblemDetailsException < ApiException

      # Create a new ProblemDetailsException.
      # @see ApiException#initialize
      def initialize(status_code, response_body, response)
        super(status_code, response_body, nil, nil, 'the payment platform returned a problem details error response')
        @response = response
      end

      # The problem details response.
      # @return [OnlinePayments::SDK::Domain::ProblemDetailsResponse, nil]
      def response
        @response
      end
    end
  end
end
