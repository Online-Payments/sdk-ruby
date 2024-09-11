#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/address_personal'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AddressPersonal] billing_address
    # @attr [OnlinePayments::SDK::Domain::AddressPersonal] shipping_address
    class PaymentProduct3203SpecificOutput < OnlinePayments::SDK::DataObject
      attr_accessor :billing_address
      attr_accessor :shipping_address

      # @return (Hash)
      def to_h
        hash = super
        hash['billingAddress'] = @billing_address.to_h if @billing_address
        hash['shippingAddress'] = @shipping_address.to_h if @shipping_address
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'billingAddress'
          raise TypeError, "value '%s' is not a Hash" % [hash['billingAddress']] unless hash['billingAddress'].is_a? Hash
          @billing_address = OnlinePayments::SDK::Domain::AddressPersonal.new_from_hash(hash['billingAddress'])
        end
        if hash.key? 'shippingAddress'
          raise TypeError, "value '%s' is not a Hash" % [hash['shippingAddress']] unless hash['shippingAddress'].is_a? Hash
          @shipping_address = OnlinePayments::SDK::Domain::AddressPersonal.new_from_hash(hash['shippingAddress'])
        end
      end
    end
  end
end
