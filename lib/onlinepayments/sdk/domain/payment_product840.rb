# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] order_id
      class PaymentProduct840 < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :order_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(order_id: nil)
          super()
          @order_id = order_id
        end

        # Sets the property and returns this same instance.
        def with_order_id(value)
          @order_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['orderId'] = @order_id unless @order_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'orderId'
            @order_id = hash['orderId']
          end
        end
      end
    end
  end
end
