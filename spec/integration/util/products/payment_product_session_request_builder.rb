require 'onlinepayments/sdk/domain/payment_product_session302_specific_input'
require 'onlinepayments/sdk/domain/payment_product_session_request'

module Integration
  module Util
    module Products
      class PaymentProductSessionRequestBuilder
        def initialize
          @display_name = 'Test Merchant'
          @domain_name  = 'example.com'
        end

        def build
          specific = OnlinePayments::SDK::Domain::PaymentProductSession302SpecificInput.new
          specific.display_name = @display_name
          specific.domain_name  = @domain_name

          request = OnlinePayments::SDK::Domain::PaymentProductSessionRequest.new
          request.payment_product_session302_specific_input = specific
          request
        end
      end
    end
  end
end
