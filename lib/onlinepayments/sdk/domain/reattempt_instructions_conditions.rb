# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] max_attempts
      # @attr [Integer, nil] max_delay
      class ReattemptInstructionsConditions < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :max_attempts

        attr_accessor :max_delay

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(max_attempts: nil, max_delay: nil)
          super()
          @max_attempts = max_attempts
          @max_delay = max_delay
        end

        # Sets the property and returns this same instance.
        def with_max_attempts(value)
          @max_attempts = value
          self
        end

        # Sets the property and returns this same instance.
        def with_max_delay(value)
          @max_delay = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['maxAttempts'] = @max_attempts unless @max_attempts.nil?
          hash['maxDelay'] = @max_delay unless @max_delay.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'maxAttempts'
            @max_attempts = hash['maxAttempts']
          end
          if hash.key? 'maxDelay'
            @max_delay = hash['maxDelay']
          end
        end
      end
    end
  end
end
