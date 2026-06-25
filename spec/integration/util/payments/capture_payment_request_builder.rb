require 'onlinepayments/sdk/domain/capture_payment_request'

module Integration
  module Util
    module Payments
      class CapturePaymentRequestBuilder

        def initialize
          @amount = nil
          @is_final = nil
        end

        def with_amount(amount)
          @amount = amount
          self
        end

        def with_is_final(is_final)
          @is_final = is_final
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::CapturePaymentRequest.new
          request.amount = @amount unless @amount.nil?
          request.is_final = @is_final unless @is_final.nil?
          request
        end
      end
    end
  end
end
