#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] details
    # @attr [String] name
    # @attr [Integer] speed
    # @attr [String] type
    class ShippingMethod < OnlinePayments::SDK::DataObject
      attr_accessor :details
      attr_accessor :name
      attr_accessor :speed
      attr_accessor :type

      # @return (Hash)
      def to_h
        hash = super
        hash['details'] = @details unless @details.nil?
        hash['name'] = @name unless @name.nil?
        hash['speed'] = @speed unless @speed.nil?
        hash['type'] = @type unless @type.nil?
        hash
      end

      def from_hash(hash)
        super
        @details = hash['details'] if hash.key? 'details'
        @name = hash['name'] if hash.key? 'name'
        @speed = hash['speed'] if hash.key? 'speed'
        @type = hash['type'] if hash.key? 'type'
      end
    end
  end
end
