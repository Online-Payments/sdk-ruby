# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/address_personal'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/shipping_method'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AddressPersonal, nil] address
      # @attr [String, nil] address_indicator
      # @attr [String, nil] email_address
      # @attr [String, nil] first_usage_date
      # @attr [true/false, nil] is_first_usage
      # @attr [OnlinePayments::SDK::Domain::ShippingMethod, nil] method
      # @attr [Integer, nil] shipping_cost
      # @attr [Integer, nil] shipping_cost_tax
      # @attr [String, nil] type
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

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(address: nil,
                       address_indicator: nil,
                       email_address: nil,
                       first_usage_date: nil,
                       is_first_usage: nil,
                       method: nil,
                       shipping_cost: nil,
                       shipping_cost_tax: nil,
                       type: nil)
          super()
          @address = address
          @address_indicator = address_indicator
          @email_address = email_address
          @first_usage_date = first_usage_date
          @is_first_usage = is_first_usage
          @method = method
          @shipping_cost = shipping_cost
          @shipping_cost_tax = shipping_cost_tax
          @type = type
        end

        # Sets the property and returns this same instance.
        def with_address(value)
          @address = value
          self
        end

        # Sets the property and returns this same instance.
        def with_address_indicator(value)
          @address_indicator = value
          self
        end

        # Sets the property and returns this same instance.
        def with_email_address(value)
          @email_address = value
          self
        end

        # Sets the property and returns this same instance.
        def with_first_usage_date(value)
          @first_usage_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_first_usage(value)
          @is_first_usage = value
          self
        end

        # Sets the property and returns this same instance.
        def with_method(value)
          @method = value
          self
        end

        # Sets the property and returns this same instance.
        def with_shipping_cost(value)
          @shipping_cost = value
          self
        end

        # Sets the property and returns this same instance.
        def with_shipping_cost_tax(value)
          @shipping_cost_tax = value
          self
        end

        # Sets the property and returns this same instance.
        def with_type(value)
          @type = value
          self
        end

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
          if hash.key? 'address'
            raise TypeError, "value '#{hash['address']}' is not a Hash" unless hash['address'].is_a? Hash
            @address = OnlinePayments::SDK::Domain::AddressPersonal.new_from_hash(hash['address'])
          end
          if hash.key? 'addressIndicator'
            @address_indicator = hash['addressIndicator']
          end
          if hash.key? 'emailAddress'
            @email_address = hash['emailAddress']
          end
          if hash.key? 'firstUsageDate'
            @first_usage_date = hash['firstUsageDate']
          end
          if hash.key? 'isFirstUsage'
            @is_first_usage = hash['isFirstUsage']
          end
          if hash.key? 'method'
            raise TypeError, "value '#{hash['method']}' is not a Hash" unless hash['method'].is_a? Hash
            @method = OnlinePayments::SDK::Domain::ShippingMethod.new_from_hash(hash['method'])
          end
          if hash.key? 'shippingCost'
            @shipping_cost = hash['shippingCost']
          end
          if hash.key? 'shippingCostTax'
            @shipping_cost_tax = hash['shippingCostTax']
          end
          if hash.key? 'type'
            @type = hash['type']
          end
        end
      end
    end
  end
end
