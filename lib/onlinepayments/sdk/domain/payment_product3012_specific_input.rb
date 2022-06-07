#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [true/false] force_authentication
    # @attr [true/false] is_wip_transaction
    class PaymentProduct3012SpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :force_authentication
      attr_accessor :is_wip_transaction

      # @return (Hash)
      def to_h
        hash = super
        hash['forceAuthentication'] = @force_authentication unless @force_authentication.nil?
        hash['isWipTransaction'] = @is_wip_transaction unless @is_wip_transaction.nil?
        hash
      end

      def from_hash(hash)
        super
        @force_authentication = hash['forceAuthentication'] if hash.key? 'forceAuthentication'
        @is_wip_transaction = hash['isWipTransaction'] if hash.key? 'isWipTransaction'
      end
    end
  end
end
