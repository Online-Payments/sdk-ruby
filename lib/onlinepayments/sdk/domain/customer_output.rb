#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/customer_device_output'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::CustomerDeviceOutput] device
    class CustomerOutput < OnlinePayments::SDK::DataObject
      attr_accessor :device

      # @return (Hash)
      def to_h
        hash = super
        hash['device'] = @device.to_h if @device
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'device'
          raise TypeError, "value '%s' is not a Hash" % [hash['device']] unless hash['device'].is_a? Hash
          @device = OnlinePayments::SDK::Domain::CustomerDeviceOutput.new_from_hash(hash['device'])
        end
      end
    end
  end
end
