#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] acs_transaction_id
    # @attr [String] method
    # @attr [String] utc_timestamp
    class ThreeDSecureData < OnlinePayments::SDK::DataObject
      attr_accessor :acs_transaction_id
      attr_accessor :method
      attr_accessor :utc_timestamp

      # @return (Hash)
      def to_h
        hash = super
        hash['acsTransactionId'] = @acs_transaction_id unless @acs_transaction_id.nil?
        hash['method'] = @method unless @method.nil?
        hash['utcTimestamp'] = @utc_timestamp unless @utc_timestamp.nil?
        hash
      end

      def from_hash(hash)
        super
        @acs_transaction_id = hash['acsTransactionId'] if hash.key? 'acsTransactionId'
        @method = hash['method'] if hash.key? 'method'
        @utc_timestamp = hash['utcTimestamp'] if hash.key? 'utcTimestamp'
      end
    end
  end
end
