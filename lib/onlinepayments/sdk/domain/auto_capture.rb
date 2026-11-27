# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] delay_in_minutes
      class AutoCapture < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :delay_in_minutes

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(delay_in_minutes: nil)
          super()
          @delay_in_minutes = delay_in_minutes
        end

        # Sets the property and returns this same instance.
        def with_delay_in_minutes(value)
          @delay_in_minutes = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['delayInMinutes'] = @delay_in_minutes unless @delay_in_minutes.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'delayInMinutes'
            @delay_in_minutes = hash['delayInMinutes']
          end
        end
      end
    end
  end
end
