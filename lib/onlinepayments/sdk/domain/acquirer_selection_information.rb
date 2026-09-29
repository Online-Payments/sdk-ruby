#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] fallback_level
      # @attr [String, nil] result
      # @attr [String, nil] rule_name
      class AcquirerSelectionInformation < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :fallback_level

        attr_accessor :result

        attr_accessor :rule_name

        # Sets the property and returns this same instance.
        def with_fallback_level(value)
          @fallback_level = value
          self
        end

        # Sets the property and returns this same instance.
        def with_result(value)
          @result = value
          self
        end

        # Sets the property and returns this same instance.
        def with_rule_name(value)
          @rule_name = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['fallbackLevel'] = @fallback_level unless @fallback_level.nil?
          hash['result'] = @result unless @result.nil?
          hash['ruleName'] = @rule_name unless @rule_name.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'fallbackLevel'
            @fallback_level = hash['fallbackLevel']
          end
          if hash.has_key? 'result'
            @result = hash['result']
          end
          if hash.has_key? 'ruleName'
            @rule_name = hash['ruleName']
          end
        end
      end
    end
  end
end
