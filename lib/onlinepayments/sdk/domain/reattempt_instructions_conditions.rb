#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer] max_attempts
      # @attr [Integer] max_delay
      class ReattemptInstructionsConditions < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :max_attempts

        attr_accessor :max_delay

        # @return (Hash)
        def to_h
          hash = super
          hash['maxAttempts'] = @max_attempts unless @max_attempts.nil?
          hash['maxDelay'] = @max_delay unless @max_delay.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'maxAttempts'
            @max_attempts = hash['maxAttempts']
          end
          if hash.has_key? 'maxDelay'
            @max_delay = hash['maxDelay']
          end
        end
      end
    end
  end
end
