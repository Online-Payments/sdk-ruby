#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] details
      # @attr [String] name
      # @attr [Integer] speed
      # @attr [String] type
      class ShippingMethod < OnlinePayments::SDK::Domain::DataObject

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
          if hash.has_key? 'details'
            @details = hash['details']
          end
          if hash.has_key? 'name'
            @name = hash['name']
          end
          if hash.has_key? 'speed'
            @speed = hash['speed']
          end
          if hash.has_key? 'type'
            @type = hash['type']
          end
        end
      end
    end
  end
end
