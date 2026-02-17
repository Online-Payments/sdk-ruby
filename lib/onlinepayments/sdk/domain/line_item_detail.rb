#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] line_item_id
      # @attr [Integer] quantity
      class LineItemDetail < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :line_item_id

        attr_accessor :quantity

        # @return (Hash)
        def to_h
          hash = super
          hash['lineItemId'] = @line_item_id unless @line_item_id.nil?
          hash['quantity'] = @quantity unless @quantity.nil?
          hash
        end

        def from_hash(hash)
          super
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
