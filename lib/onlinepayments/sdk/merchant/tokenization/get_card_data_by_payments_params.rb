#
# This file was automatically generated.
#
require 'onlinepayments/sdk/communication/param_request'
require 'onlinepayments/sdk/communication/request_param'

module OnlinePayments
  module SDK
    module Merchant
      module Tokenization
        # Query parameters for Get sensitive card details by card payment identifiers (/v2/{merchantId}/detokenize/payments)
        #
        # @attr [Array<String>] payments
        class GetCardDataByPaymentsParams < OnlinePayments::SDK::Communication::ParamRequest

          attr_accessor :payments

          # Adds the parameter _value_ to the _payments_ Array
          #
          # @param value [String]
          def add_payments(value)
            unless @payments
              @payments = []
            end
            @payments << value
          end

          # @return [Array<OnlinePayments::SDK::Communication::RequestParam>] representing the attributes of this class
          def to_request_parameters
            result = []
            unless @payments.nil?
              @payments.each {|e| result << RequestParam.new('payments', e)}
            end
            result
          end
        end
      end
    end
  end
end
