#
# This file was automatically generated.
#
require 'onlinepayments/sdk/communication/param_request'
require 'onlinepayments/sdk/communication/request_param'

module OnlinePayments
  module SDK
    module Merchant
      module PaymentLinks
        # Query parameters for Get payment links (/v2/{merchantId}/paymentlinks)
        #
        # @attr [String] operation_group_reference
        class GetPaymentLinksInBulkParams < OnlinePayments::SDK::Communication::ParamRequest

          attr_accessor :operation_group_reference

          # @return [Array<OnlinePayments::SDK::Communication::RequestParam>] representing the attributes of this class
          def to_request_parameters
            result = []
            result << RequestParam.new('operationGroupReference', @operation_group_reference) unless @operation_group_reference.nil?
            result
          end
        end
      end
    end
  end
end
