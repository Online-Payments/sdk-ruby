#
# This file was automatically generated.
#
require 'onlinepayments/sdk/communication/param_request'
require 'onlinepayments/sdk/communication/request_param'

module OnlinePayments
  module SDK
    module Merchant
      module MerchantBatch
        # Query parameters for Get payments report (/v2/{merchantId}/merchant-batches/{merchantBatchReference}/reports/payments)
        #
        # @attr [String] cursor
        # @attr [Integer] limit
        class GetPaymentsReportParams < OnlinePayments::SDK::Communication::ParamRequest

          attr_accessor :cursor

          attr_accessor :limit

          # @return [Array<OnlinePayments::SDK::Communication::RequestParam>] representing the attributes of this class
          def to_request_parameters
            result = []
            result << OnlinePayments::SDK::Communication::RequestParam.new('cursor', @cursor) unless @cursor.nil?
            result << OnlinePayments::SDK::Communication::RequestParam.new('limit', @limit.to_s) unless @limit.nil?
            result
          end
        end
      end
    end
  end
end
