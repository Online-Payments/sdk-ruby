#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] purchase_type
    # @attr [String] transaction_type
    class OrderTypeInformation < OnlinePayments::SDK::DataObject
      attr_accessor :purchase_type
      attr_accessor :transaction_type

      # @return (Hash)
      def to_h
        hash = super
        hash['purchaseType'] = @purchase_type unless @purchase_type.nil?
        hash['transactionType'] = @transaction_type unless @transaction_type.nil?
        hash
      end

      def from_hash(hash)
        super
        @purchase_type = hash['purchaseType'] if hash.key? 'purchaseType'
        @transaction_type = hash['transactionType'] if hash.key? 'transactionType'
      end
    end
  end
end
