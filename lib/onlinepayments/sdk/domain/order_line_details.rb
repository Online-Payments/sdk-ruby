#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] discount_amount
      # @attr [String, nil] product_brand
      # @attr [String, nil] product_code
      # @attr [String, nil] product_name
      # @attr [Integer, nil] product_price
      # @attr [String, nil] product_type
      # @attr [Integer, nil] quantity
      # @attr [Integer, nil] tax_amount
      # @attr [float, nil] tax_percentage
      # @attr [String, nil] unit
      class OrderLineDetails < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :discount_amount

        attr_accessor :product_brand

        attr_accessor :product_code

        attr_accessor :product_name

        attr_accessor :product_price

        attr_accessor :product_type

        attr_accessor :quantity

        attr_accessor :tax_amount

        attr_accessor :tax_percentage

        attr_accessor :unit

        # Sets the property and returns this same instance.
        def with_discount_amount(value)
          @discount_amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_product_brand(value)
          @product_brand = value
          self
        end

        # Sets the property and returns this same instance.
        def with_product_code(value)
          @product_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_product_name(value)
          @product_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_product_price(value)
          @product_price = value
          self
        end

        # Sets the property and returns this same instance.
        def with_product_type(value)
          @product_type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_quantity(value)
          @quantity = value
          self
        end

        # Sets the property and returns this same instance.
        def with_tax_amount(value)
          @tax_amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_tax_percentage(value)
          @tax_percentage = value
          self
        end

        # Sets the property and returns this same instance.
        def with_unit(value)
          @unit = value
          self
        end

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
          hash['taxPercentage'] = @tax_percentage unless @tax_percentage.nil?
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
          if hash.has_key? 'taxPercentage'
            @tax_percentage = hash['taxPercentage']
          end
          if hash.has_key? 'unit'
            @unit = hash['unit']
          end
        end
      end
    end
  end
end
