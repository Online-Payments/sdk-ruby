#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/address_personal'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AddressPersonal] billing_address
      # @attr [OnlinePayments::SDK::Domain::AddressPersonal] shipping_address
      class PaymentProduct3203SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :billing_address

        attr_accessor :shipping_address

        # @return (Hash)
        def to_h
          hash = super
          hash['billingAddress'] = @billing_address.to_h unless @billing_address.nil?
          hash['shippingAddress'] = @shipping_address.to_h unless @shipping_address.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'billingAddress'
            raise TypeError, "value '%s' is not a Hash" % [hash['billingAddress']] unless hash['billingAddress'].is_a? Hash
            @billing_address = OnlinePayments::SDK::Domain::AddressPersonal.new_from_hash(hash['billingAddress'])
          end
          if hash.has_key? 'shippingAddress'
            raise TypeError, "value '%s' is not a Hash" % [hash['shippingAddress']] unless hash['shippingAddress'].is_a? Hash
            @shipping_address = OnlinePayments::SDK::Domain::AddressPersonal.new_from_hash(hash['shippingAddress'])
          end
        end
      end
    end
  end
end
