# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/customer_device_output'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CustomerDeviceOutput, nil] device
      class CustomerOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :device

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(device: nil)
          super()
          @device = device
        end

        # Sets the property and returns this same instance.
        def with_device(value)
          @device = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['device'] = @device.to_h unless @device.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'device'
            raise TypeError, "value '#{hash['device']}' is not a Hash" unless hash['device'].is_a? Hash
            @device = OnlinePayments::SDK::Domain::CustomerDeviceOutput.new_from_hash(hash['device'])
          end
        end
      end
    end
  end
end
