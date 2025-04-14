#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] black_list_data
      # @attr [String] customer_ip_address
      # @attr [Array<String>] product_categories
      class FraudFields < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :black_list_data

        # @deprecated Use order.customer.device.ipAddress instead.  The IP Address of the customer that is making the payment
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
          if hash.has_key? 'blackListData'
            @black_list_data = hash['blackListData']
          end
          if hash.has_key? 'customerIpAddress'
            @customer_ip_address = hash['customerIpAddress']
          end
          if hash.has_key? 'productCategories'
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
end
