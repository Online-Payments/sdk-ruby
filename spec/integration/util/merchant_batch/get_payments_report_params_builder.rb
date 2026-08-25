require 'onlinepayments/sdk/merchant/merchantbatch/get_payments_report_params'

module Integration
  module Util
    module MerchantBatch
      class GetPaymentsReportParamsBuilder
        def initialize
          @cursor = nil
          @limit = nil
        end

        def with_cursor(cursor)
          @cursor = cursor
          self
        end

        def with_limit(limit)
          @limit = limit
          self
        end

        def build
          params = OnlinePayments::SDK::Merchant::MerchantBatch::GetPaymentsReportParams.new

          params.cursor = @cursor unless @cursor.nil?
          params.limit = @limit unless @limit.nil?

          params
        end
      end
    end
  end
end
