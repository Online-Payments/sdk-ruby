require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/increment_authorization_request'

module Integration
  module Util
    module PreAuthorization
      class IncrementAuthorizationRequestBuilder

        def initialize
          @amount = 1500
          @currency = 'EUR'
        end

        def with_amount(amount)
          @amount = amount
          self
        end

        def with_currency(currency)
          @currency = currency
          self
        end

        def build
          amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
          amount_of_money.amount = @amount
          amount_of_money.currency_code = @currency

          request = OnlinePayments::SDK::Domain::IncrementAuthorizationRequest.new
          request.amount_of_money = amount_of_money
          request
        end
      end
    end
  end
end
