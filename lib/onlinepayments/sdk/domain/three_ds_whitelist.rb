#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] source
    # @attr [String] status
    class ThreeDSWhitelist < OnlinePayments::SDK::DataObject
      attr_accessor :source
      attr_accessor :status

      # @return (Hash)
      def to_h
        hash = super
        hash['source'] = @source unless @source.nil?
        hash['status'] = @status unless @status.nil?
        hash
      end

      def from_hash(hash)
        super
        @source = hash['source'] if hash.key? 'source'
        @status = hash['status'] if hash.key? 'status'
      end
    end
  end
end
