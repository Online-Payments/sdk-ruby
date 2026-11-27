# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] black_list_data
      # @attr [String, nil] customer_ip_address
      # @attr [Array<String>, nil] product_categories
      class FraudFields < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :black_list_data

        # @deprecated Use order.customer.device.ipAddress instead.  The IP Address of the customer that is making the payment
        attr_accessor :customer_ip_address

        attr_accessor :product_categories

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(black_list_data: nil, customer_ip_address: nil, product_categories: nil)
          super()
          @black_list_data = black_list_data
          @customer_ip_address = customer_ip_address
          @product_categories = product_categories
        end

        # Sets the property and returns this same instance.
        def with_black_list_data(value)
          @black_list_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_customer_ip_address(value)
          @customer_ip_address = value
          self
        end

        # Sets the property and returns this same instance.
        def with_product_categories(value)
          @product_categories = value
          self
        end

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
          if hash.key? 'blackListData'
            @black_list_data = hash['blackListData']
          end
          if hash.key? 'customerIpAddress'
            @customer_ip_address = hash['customerIpAddress']
          end
          if hash.key? 'productCategories'
            raise TypeError, "value '#{hash['productCategories']}' is not an Array" unless hash['productCategories'].is_a? Array
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
