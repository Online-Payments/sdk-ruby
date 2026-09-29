#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] discount_amount
      # @attr [String, nil] line_item_id
      # @attr [Integer, nil] quantity
      class LineItemDetail < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :discount_amount

        attr_accessor :line_item_id

        attr_accessor :quantity

        # Sets the property and returns this same instance.
        def with_discount_amount(value)
          @discount_amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_line_item_id(value)
          @line_item_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_quantity(value)
          @quantity = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['discountAmount'] = @discount_amount unless @discount_amount.nil?
          hash['lineItemId'] = @line_item_id unless @line_item_id.nil?
          hash['quantity'] = @quantity unless @quantity.nil?
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
        end
      end
    end
  end
end
