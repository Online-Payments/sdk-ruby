#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/customer_device_output'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CustomerDeviceOutput] device
      class CustomerOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :device

        # @return (Hash)
        def to_h
          hash = super
          hash['device'] = @device.to_h unless @device.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'device'
            raise TypeError, "value '%s' is not a Hash" % [hash['device']] unless hash['device'].is_a? Hash
            @device = OnlinePayments::SDK::Domain::CustomerDeviceOutput.new_from_hash(hash['device'])
          end
        end
      end
    end
  end
end
