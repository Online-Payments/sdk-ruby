# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] capture_trigger
      class RedirectPaymentProduct900SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :capture_trigger

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(capture_trigger: nil)
          super()
          @capture_trigger = capture_trigger
        end

        # Sets the property and returns this same instance.
        def with_capture_trigger(value)
          @capture_trigger = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['captureTrigger'] = @capture_trigger unless @capture_trigger.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'captureTrigger'
            @capture_trigger = hash['captureTrigger']
          end
        end
      end
    end
  end
end
