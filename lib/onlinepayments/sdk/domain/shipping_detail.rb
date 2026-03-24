#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer] shipping_cost
      # @attr [Integer] shipping_cost_tax
      class ShippingDetail < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :shipping_cost

        attr_accessor :shipping_cost_tax

        # @return (Hash)
        def to_h
          hash = super
          hash['shippingCost'] = @shipping_cost unless @shipping_cost.nil?
          hash['shippingCostTax'] = @shipping_cost_tax unless @shipping_cost_tax.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'shippingCost'
            @shipping_cost = hash['shippingCost']
          end
          if hash.has_key? 'shippingCostTax'
            @shipping_cost_tax = hash['shippingCostTax']
          end
        end
      end
    end
  end
end
