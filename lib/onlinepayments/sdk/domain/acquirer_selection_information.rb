#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [Integer] fallback_level
    # @attr [String] result
    # @attr [String] rule_name
    class AcquirerSelectionInformation < OnlinePayments::SDK::DataObject
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
        @fallback_level = hash['fallbackLevel'] if hash.key? 'fallbackLevel'
        @result = hash['result'] if hash.key? 'result'
        @rule_name = hash['ruleName'] if hash.key? 'ruleName'
      end
    end
  end
end
