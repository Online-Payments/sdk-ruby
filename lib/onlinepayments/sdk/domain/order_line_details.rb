#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer] discount_amount
      # @attr [String] product_brand
      # @attr [String] product_code
      # @attr [String] product_name
      # @attr [Integer] product_price
      # @attr [String] product_type
      # @attr [Integer] quantity
      # @attr [Integer] tax_amount
      # @attr [String] unit
      class OrderLineDetails < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :discount_amount

        attr_accessor :product_brand

        attr_accessor :product_code

        attr_accessor :product_name

        attr_accessor :product_price

        attr_accessor :product_type

        attr_accessor :quantity

        attr_accessor :tax_amount

        attr_accessor :unit

        # @return (Hash)
        def to_h
          hash = super
          hash['discountAmount'] = @discount_amount unless @discount_amount.nil?
          hash['productBrand'] = @product_brand unless @product_brand.nil?
          hash['productCode'] = @product_code unless @product_code.nil?
          hash['productName'] = @product_name unless @product_name.nil?
          hash['productPrice'] = @product_price unless @product_price.nil?
          hash['productType'] = @product_type unless @product_type.nil?
          hash['quantity'] = @quantity unless @quantity.nil?
          hash['taxAmount'] = @tax_amount unless @tax_amount.nil?
          hash['unit'] = @unit unless @unit.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'discountAmount'
            @discount_amount = hash['discountAmount']
          end
          if hash.has_key? 'productBrand'
            @product_brand = hash['productBrand']
          end
          if hash.has_key? 'productCode'
            @product_code = hash['productCode']
          end
          if hash.has_key? 'productName'
            @product_name = hash['productName']
          end
          if hash.has_key? 'productPrice'
            @product_price = hash['productPrice']
          end
          if hash.has_key? 'productType'
            @product_type = hash['productType']
          end
          if hash.has_key? 'quantity'
            @quantity = hash['quantity']
          end
          if hash.has_key? 'taxAmount'
            @tax_amount = hash['taxAmount']
          end
          if hash.has_key? 'unit'
            @unit = hash['unit']
          end
        end
      end
    end
  end
end
