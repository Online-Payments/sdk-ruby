#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [Long] amount
    class Discount < OnlinePayments::SDK::DataObject
      attr_accessor :amount

      # @return (Hash)
      def to_h
        hash = super
        hash['amount'] = @amount unless @amount.nil?
        hash
      end

      def from_hash(hash)
        super
        @amount = hash['amount'] if hash.key? 'amount'
      end
    end
  end
end
