# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/address_personal'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AddressPersonal, nil] billing_address
      # @attr [OnlinePayments::SDK::Domain::AddressPersonal, nil] shipping_address
      class PaymentProduct3203SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :billing_address

        attr_accessor :shipping_address

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(billing_address: nil, shipping_address: nil)
          super()
          @billing_address = billing_address
          @shipping_address = shipping_address
        end

        # Sets the property and returns this same instance.
        def with_billing_address(value)
          @billing_address = value
          self
        end

        # Sets the property and returns this same instance.
        def with_shipping_address(value)
          @shipping_address = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['billingAddress'] = @billing_address.to_h unless @billing_address.nil?
          hash['shippingAddress'] = @shipping_address.to_h unless @shipping_address.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'billingAddress'
            raise TypeError, "value '#{hash['billingAddress']}' is not a Hash" unless hash['billingAddress'].is_a? Hash
            @billing_address = OnlinePayments::SDK::Domain::AddressPersonal.new_from_hash(hash['billingAddress'])
          end
          if hash.key? 'shippingAddress'
            raise TypeError, "value '#{hash['shippingAddress']}' is not a Hash" unless hash['shippingAddress'].is_a? Hash
            @shipping_address = OnlinePayments::SDK::Domain::AddressPersonal.new_from_hash(hash['shippingAddress'])
          end
        end
      end
    end
  end
end
