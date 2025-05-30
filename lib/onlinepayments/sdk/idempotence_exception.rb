#
# This file was automatically generated.
#
require_relative 'api_exception'

module OnlinePayments
  module SDK
    # Represents an error response from the payment platform when an idempotent request failed because the first request has not finished yet.
    # The _idempotence_request_timestamp_ indicates the time when the first request with this _idempotence_key_ arrived.
    #
    # @attr_reader [String] idempotence_key                The idempotence key used in the request.
    # @attr_reader [Integer] idempotence_request_timestamp A timestamp indicating the arrival time of the request that conflicts with the request just sent.
    class IdempotenceException < ApiException

      # Create a new IdempotenceException.
      # @see ApiException#initialize
      def initialize(status_code, response_body, error_id, errors, idempotence_key, idempotence_request_timestamp,
                     message='the payment platform returned a duplicate request error response')
        super(status_code, response_body, error_id, errors, message)
        @idempotence_key = idempotence_key
        @idempotence_request_timestamp = idempotence_request_timestamp
      end

      attr_reader :idempotence_key
      attr_reader :idempotence_request_timestamp
    end
  end
end
