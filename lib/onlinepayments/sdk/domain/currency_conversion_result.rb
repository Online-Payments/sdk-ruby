# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] result
      # @attr [String, nil] result_reason
      class CurrencyConversionResult < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :result

        attr_accessor :result_reason

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(result: nil, result_reason: nil)
          super()
          @result = result
          @result_reason = result_reason
        end

        # Sets the property and returns this same instance.
        def with_result(value)
          @result = value
          self
        end

        # Sets the property and returns this same instance.
        def with_result_reason(value)
          @result_reason = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['result'] = @result unless @result.nil?
          hash['resultReason'] = @result_reason unless @result_reason.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'result'
            @result = hash['result']
          end
          if hash.key? 'resultReason'
            @result_reason = hash['resultReason']
          end
        end
      end
    end
  end
end
