require 'date'

module OnlinePayments
  module SDK
    # A CallContext is used to identify requests and manage idempotent requests.
    # A CallContext contains the following:
    #
    # idempotence_key::                A randomly generated key used to identify requests
    # idempotence_request_timestamp::  If a previous request arrived with the same idempotence key,
    #                                  this value will be set to a timestamp of that request.
    # idempotence_response_date_time:: If a previous request arrived with the same idempotence key,
    #                                  this value will be set to the date/time of the first response.
    #
    # @attr_reader [String] idempotence_key The idempotence key used to identify this request.
    #              If two requests share the same _idempotence_key_, they are considered to be the same request
    #              and only the first request will be processed.
    # @attr        [Integer] idempotence_request_timestamp If two or more requests arrive at the Online Payments platform with the same _idempotence_key_,
    #              the _idempotence_request_timestamp_ will be set to the arrival time of the first of these requests.
    # @attr        [DateTime] idempotence_response_date_time If two or more requests arrive at the Online Payments platform with the same _idempotence_key_,
    #              the _idempotence_response_date_time_ will be set to the response date/time of the first response.
    class CallContext
      @idempotence_key = nil
      @idempotence_request_timestamp = nil
      @idempotence_response_date_time = nil

      def initialize(idempotence_key = nil)
        @idempotence_key = idempotence_key
      end

      attr_reader :idempotence_key
      attr_accessor :idempotence_request_timestamp
      attr_accessor :idempotence_response_date_time
    end
  end
end
