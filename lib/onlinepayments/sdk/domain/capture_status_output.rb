#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [Integer] status_code
    class CaptureStatusOutput < OnlinePayments::SDK::DataObject
      attr_accessor :status_code

      # @return (Hash)
      def to_h
        hash = super
        hash['statusCode'] = @status_code unless @status_code.nil?
        hash
      end

      def from_hash(hash)
        super
        @status_code = hash['statusCode'] if hash.key? 'statusCode'
      end
    end
  end
end
