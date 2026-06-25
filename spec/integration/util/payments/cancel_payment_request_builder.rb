require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/cancel_payment_request'

module Integration
  module Util
    module Payments
      class CancelPaymentRequestBuilder

        def initialize
          @amount = nil
          @currency = nil
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
          request = OnlinePayments::SDK::Domain::CancelPaymentRequest.new

          if !@amount.nil? && !@currency.nil?
            amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
            amount_of_money.amount = @amount
            amount_of_money.currency_code = @currency
            request.amount_of_money = amount_of_money
          end

          request.is_final = @is_final unless @is_final.nil?
          request
        end
      end
    end
  end
end
