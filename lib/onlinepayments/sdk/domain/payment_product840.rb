#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] order_id
    class PaymentProduct840 < OnlinePayments::SDK::DataObject
      attr_accessor :order_id

      # @return (Hash)
      def to_h
        hash = super
        hash['orderId'] = @order_id unless @order_id.nil?
        hash
      end

      def from_hash(hash)
        super
        @order_id = hash['orderId'] if hash.key? 'orderId'
      end
    end
  end
end
