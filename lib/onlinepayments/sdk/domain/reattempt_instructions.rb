#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/reattempt_instructions_conditions'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::ReattemptInstructionsConditions] conditions
      # @attr [Integer] frozen_period
      # @attr [String] indicator
      class ReattemptInstructions < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :conditions

        attr_accessor :frozen_period

        attr_accessor :indicator

        # @return (Hash)
        def to_h
          hash = super
          hash['conditions'] = @conditions.to_h unless @conditions.nil?
          hash['frozenPeriod'] = @frozen_period unless @frozen_period.nil?
          hash['indicator'] = @indicator unless @indicator.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'conditions'
            raise TypeError, "value '%s' is not a Hash" % [hash['conditions']] unless hash['conditions'].is_a? Hash
            @conditions = OnlinePayments::SDK::Domain::ReattemptInstructionsConditions.new_from_hash(hash['conditions'])
          end
          if hash.has_key? 'frozenPeriod'
            @frozen_period = hash['frozenPeriod']
          end
          if hash.has_key? 'indicator'
            @indicator = hash['indicator']
          end
        end
      end
    end
  end
end
