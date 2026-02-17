#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/line_item_detail'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::LineItemDetail>] line_item_details
      class ShoppingCartOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :line_item_details

        # @return (Hash)
        def to_h
          hash = super
          hash['lineItemDetails'] = @line_item_details.collect{|val| val.to_h} unless @line_item_details.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'lineItemDetails'
            raise TypeError, "value '%s' is not an Array" % [hash['lineItemDetails']] unless hash['lineItemDetails'].is_a? Array
            @line_item_details = []
            hash['lineItemDetails'].each do |e|
              @line_item_details << OnlinePayments::SDK::Domain::LineItemDetail.new_from_hash(e)
            end
          end
        end
      end
    end
  end
end
