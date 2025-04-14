#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer] fallback_level
      # @attr [String] result
      # @attr [String] rule_name
      class AcquirerSelectionInformation < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :fallback_level

        attr_accessor :result

        attr_accessor :rule_name

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
