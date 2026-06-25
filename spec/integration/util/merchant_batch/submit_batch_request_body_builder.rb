require 'securerandom'
require 'onlinepayments/sdk/domain/batch_metadata'
require 'onlinepayments/sdk/domain/submit_batch_request_body'

module Integration
  module Util
    module MerchantBatch
      class SubmitBatchRequestBodyBuilder
        def initialize
          @merchant_batch_reference = "Ref-#{SecureRandom.uuid}"
          @operation_type = nil
          @create_payment_requests = []
          @item_count = 0
        end

        def with_merchant_batch_reference(merchant_batch_reference)
          @merchant_batch_reference = merchant_batch_reference
          self
        end

        def with_operation_type(operation_type)
          @operation_type = operation_type
          self
        end

        def with_item_count(item_count)
          @item_count = item_count
          self
        end

        def with_create_payment_requests(create_payment_requests)
          @create_payment_requests = create_payment_requests
          self
        end

        def build
          header = OnlinePayments::SDK::Domain::BatchMetadata.new
          header.item_count = @item_count
          header.merchant_batch_reference = @merchant_batch_reference
          header.operation_type = @operation_type

          body = OnlinePayments::SDK::Domain::SubmitBatchRequestBody.new
          body.header = header
          body.create_payments = @create_payment_requests.empty? ? nil : @create_payment_requests
          body
        end
      end
    end
  end
end