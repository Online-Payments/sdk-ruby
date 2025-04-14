#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] result
      # @attr [String] result_reason
      class CurrencyConversionResult < OnlinePayments::SDK::Domain::DataObject

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
          if hash.has_key? 'result'
            @result = hash['result']
          end
          if hash.has_key? 'resultReason'
            @result_reason = hash['resultReason']
          end
        end
      end
    end
  end
end
