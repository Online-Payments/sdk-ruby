#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [Long] amount
    # @attr [String] type
    class AmountBreakdown < OnlinePayments::SDK::DataObject
      attr_accessor :amount
      attr_accessor :type

      # @return (Hash)
      def to_h
        hash = super
        hash['amount'] = @amount unless @amount.nil?
        hash['type'] = @type unless @type.nil?
        hash
      end

      def from_hash(hash)
        super
        @amount = hash['amount'] if hash.key? 'amount'
        @type = hash['type'] if hash.key? 'type'
      end
    end
  end
end
