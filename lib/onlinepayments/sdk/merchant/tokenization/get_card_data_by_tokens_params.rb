#
# This file was automatically generated.
#
require 'onlinepayments/sdk/communication/param_request'
require 'onlinepayments/sdk/communication/request_param'

module OnlinePayments
  module SDK
    module Merchant
      module Tokenization
        # Query parameters for Get sensitive card details by card alias tokens (/v2/{merchantId}/detokenize/tokens)
        #
        # @attr [Array<String>] tokens
        class GetCardDataByTokensParams < OnlinePayments::SDK::Communication::ParamRequest

          attr_accessor :tokens

          # Adds the parameter _value_ to the _tokens_ Array
          #
          # @param value [String]
          def add_tokens(value)
            unless @tokens
              @tokens = []
            end
            @tokens << value
          end

          # @return [Array<OnlinePayments::SDK::Communication::RequestParam>] representing the attributes of this class
          def to_request_parameters
            result = []
            unless @tokens.nil?
              @tokens.each {|e| result << OnlinePayments::SDK::Communication::RequestParam.new('tokens', e)}
            end
            result
          end
        end
      end
    end
  end
end
