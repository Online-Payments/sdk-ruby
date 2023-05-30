#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] result
    # @attr [String] result_reason
    class CurrencyConversionResult < OnlinePayments::SDK::DataObject
      attr_accessor :result
      attr_accessor :result_reason

      # @return (Hash)
      def to_h
        hash = super
        hash['result'] = @result unless @result.nil?
        hash['resultReason'] = @result_reason unless @result_reason.nil?
        hash
      end

      def from_hash(hash)
        super
        @result = hash['result'] if hash.key? 'result'
        @result_reason = hash['resultReason'] if hash.key? 'resultReason'
      end
    end
  end
end
