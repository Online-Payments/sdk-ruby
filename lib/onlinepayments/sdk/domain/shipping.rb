#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/address_personal'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/shipping_method'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AddressPersonal] address
      # @attr [String] address_indicator
      # @attr [String] email_address
      # @attr [String] first_usage_date
      # @attr [true/false] is_first_usage
      # @attr [OnlinePayments::SDK::Domain::ShippingMethod] method
      # @attr [Integer] shipping_cost
      # @attr [Integer] shipping_cost_tax
      # @attr [String] type
      class Shipping < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :address

        attr_accessor :address_indicator

        attr_accessor :email_address

        attr_accessor :first_usage_date

        attr_accessor :is_first_usage

        attr_accessor :method

        attr_accessor :shipping_cost

        attr_accessor :shipping_cost_tax

        attr_accessor :type

        # @return (Hash)
        def to_h
          hash = super
          hash['address'] = @address.to_h unless @address.nil?
          hash['addressIndicator'] = @address_indicator unless @address_indicator.nil?
          hash['emailAddress'] = @email_address unless @email_address.nil?
          hash['firstUsageDate'] = @first_usage_date unless @first_usage_date.nil?
          hash['isFirstUsage'] = @is_first_usage unless @is_first_usage.nil?
          hash['method'] = @method.to_h unless @method.nil?
          hash['shippingCost'] = @shipping_cost unless @shipping_cost.nil?
          hash['shippingCostTax'] = @shipping_cost_tax unless @shipping_cost_tax.nil?
          hash['type'] = @type unless @type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'address'
            raise TypeError, "value '%s' is not a Hash" % [hash['address']] unless hash['address'].is_a? Hash
            @address = OnlinePayments::SDK::Domain::AddressPersonal.new_from_hash(hash['address'])
          end
          if hash.has_key? 'addressIndicator'
            @address_indicator = hash['addressIndicator']
          end
          if hash.has_key? 'emailAddress'
            @email_address = hash['emailAddress']
          end
          if hash.has_key? 'firstUsageDate'
            @first_usage_date = hash['firstUsageDate']
          end
          if hash.has_key? 'isFirstUsage'
            @is_first_usage = hash['isFirstUsage']
          end
          if hash.has_key? 'method'
            raise TypeError, "value '%s' is not a Hash" % [hash['method']] unless hash['method'].is_a? Hash
            @method = OnlinePayments::SDK::Domain::ShippingMethod.new_from_hash(hash['method'])
          end
          if hash.has_key? 'shippingCost'
            @shipping_cost = hash['shippingCost']
          end
          if hash.has_key? 'shippingCostTax'
            @shipping_cost_tax = hash['shippingCostTax']
          end
          if hash.has_key? 'type'
            @type = hash['type']
          end
        end
      end
    end
  end
end
