#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer] discount_amount
      # @attr [String] line_item_id
      # @attr [Integer] quantity
      # @attr [Integer] tax_amount
      class LineItemDetail < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :discount_amount

        attr_accessor :line_item_id

        attr_accessor :quantity

        attr_accessor :tax_amount

        # @return (Hash)
        def to_h
          hash = super
          hash['discountAmount'] = @discount_amount unless @discount_amount.nil?
          hash['lineItemId'] = @line_item_id unless @line_item_id.nil?
          hash['quantity'] = @quantity unless @quantity.nil?
          hash['taxAmount'] = @tax_amount unless @tax_amount.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'discountAmount'
            @discount_amount = hash['discountAmount']
          end
          if hash.has_key? 'lineItemId'
            @line_item_id = hash['lineItemId']
          end
          if hash.has_key? 'quantity'
            @quantity = hash['quantity']
          end
          if hash.has_key? 'taxAmount'
            @tax_amount = hash['taxAmount']
          end
        end
      end
    end
  end
end
