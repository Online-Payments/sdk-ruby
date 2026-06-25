require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/refund_request'

module Integration
  module Util
    module Payments
      class RefundRequestBuilder

        def initialize
          @amount = 1000
          @currency = 'EUR'
          @is_final = nil
        end

        def with_amount(amount)
          @amount = amount
          self
        end

        def with_currency(currency)
          @currency = currency
          self
        end

        def with_is_final(is_final)
          @is_final = is_final
          self
        end

        def build
          amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
          amount_of_money.amount = @amount
          amount_of_money.currency_code = @currency

          request = OnlinePayments::SDK::Domain::RefundRequest.new
          request.amount_of_money = amount_of_money
          request.is_final = @is_final unless @is_final.nil?
          request
        end
      end
    end
  end
end
