#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [Long] discount_amount
    # @attr [String] product_code
    # @attr [String] product_name
    # @attr [Long] product_price
    # @attr [String] product_type
    # @attr [Long] quantity
    # @attr [Long] tax_amount
    # @attr [String] unit
    class OrderLineDetails < OnlinePayments::SDK::DataObject
      attr_accessor :discount_amount
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
        @discount_amount = hash['discountAmount'] if hash.key? 'discountAmount'
        @product_code = hash['productCode'] if hash.key? 'productCode'
        @product_name = hash['productName'] if hash.key? 'productName'
        @product_price = hash['productPrice'] if hash.key? 'productPrice'
        @product_type = hash['productType'] if hash.key? 'productType'
        @quantity = hash['quantity'] if hash.key? 'quantity'
        @tax_amount = hash['taxAmount'] if hash.key? 'taxAmount'
        @unit = hash['unit'] if hash.key? 'unit'
      end
    end
  end
end
