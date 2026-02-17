#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] order_id
      class PaymentProduct840 < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :order_id

        # @return (Hash)
        def to_h
          hash = super
          hash['orderId'] = @order_id unless @order_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'orderId'
            @order_id = hash['orderId']
          end
        end
      end
    end
  end
end
