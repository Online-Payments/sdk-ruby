#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/address_personal'
require 'onlinepayments/sdk/domain/shipping_method'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AddressPersonal] address
    # @attr [String] address_indicator
    # @attr [String] email_address
    # @attr [String] first_usage_date
    # @attr [true/false] is_first_usage
    # @attr [OnlinePayments::SDK::Domain::ShippingMethod] method
    # @attr [Long] shipping_cost
    # @attr [Long] shipping_cost_tax
    # @attr [String] type
    class Shipping < OnlinePayments::SDK::DataObject
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
        hash['address'] = @address.to_h if @address
        hash['addressIndicator'] = @address_indicator unless @address_indicator.nil?
        hash['emailAddress'] = @email_address unless @email_address.nil?
        hash['firstUsageDate'] = @first_usage_date unless @first_usage_date.nil?
        hash['isFirstUsage'] = @is_first_usage unless @is_first_usage.nil?
        hash['method'] = @method.to_h if @method
        hash['shippingCost'] = @shipping_cost unless @shipping_cost.nil?
        hash['shippingCostTax'] = @shipping_cost_tax unless @shipping_cost_tax.nil?
        hash['type'] = @type unless @type.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'address'
          raise TypeError, "value '%s' is not a Hash" % [hash['address']] unless hash['address'].is_a? Hash
          @address = OnlinePayments::SDK::Domain::AddressPersonal.new_from_hash(hash['address'])
        end
        @address_indicator = hash['addressIndicator'] if hash.key? 'addressIndicator'
        @email_address = hash['emailAddress'] if hash.key? 'emailAddress'
        @first_usage_date = hash['firstUsageDate'] if hash.key? 'firstUsageDate'
        @is_first_usage = hash['isFirstUsage'] if hash.key? 'isFirstUsage'
        if hash.key? 'method'
          raise TypeError, "value '%s' is not a Hash" % [hash['method']] unless hash['method'].is_a? Hash
          @method = OnlinePayments::SDK::Domain::ShippingMethod.new_from_hash(hash['method'])
        end
        @shipping_cost = hash['shippingCost'] if hash.key? 'shippingCost'
        @shipping_cost_tax = hash['shippingCostTax'] if hash.key? 'shippingCostTax'
        @type = hash['type'] if hash.key? 'type'
      end
    end
  end
end
