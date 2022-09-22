#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] black_list_data
    # @attr [String] customer_ip_address
    # @attr [Array<String>] product_categories
    class FraudFields < OnlinePayments::SDK::DataObject
      attr_accessor :black_list_data
      attr_accessor :customer_ip_address
      attr_accessor :product_categories

      # @return (Hash)
      def to_h
        hash = super
        hash['blackListData'] = @black_list_data unless @black_list_data.nil?
        hash['customerIpAddress'] = @customer_ip_address unless @customer_ip_address.nil?
        hash['productCategories'] = @product_categories unless @product_categories.nil?
        hash
      end

      def from_hash(hash)
        super
        @black_list_data = hash['blackListData'] if hash.key? 'blackListData'
        @customer_ip_address = hash['customerIpAddress'] if hash.key? 'customerIpAddress'
        if hash.key? 'productCategories'
          raise TypeError, "value '%s' is not an Array" % [hash['productCategories']] unless hash['productCategories'].is_a? Array
          @product_categories = []
          hash['productCategories'].each do |e|
            @product_categories << e
          end
        end
      end
    end
  end
end
