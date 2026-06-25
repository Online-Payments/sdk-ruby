require 'onlinepayments/sdk/domain/subsequent_payment_request'
require 'onlinepayments/sdk/domain/subsequent_card_payment_method_specific_input'
require 'onlinepayments/sdk/domain/order'
require 'onlinepayments/sdk/domain/amount_of_money'

module Integration
  module Util
    module Subsequent
      class SubsequentPaymentRequestBuilder
        def initialize
          @amount = 1000
          @currency = 'EUR'
          @subsequent_type = 'Recurring'
          @authorization_mode = 'FINAL_AUTHORIZATION'
        end

        def with_amount(amount)
          @amount = amount
          self
        end

        def with_currency(currency)
          @currency = currency
          self
        end

        def with_subsequent_type(subsequent_type)
          @subsequent_type = subsequent_type
          self
        end

        def with_authorization_mode(authorization_mode)
          @authorization_mode = authorization_mode
          self
        end

        def build
          amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
          amount_of_money.amount = @amount
          amount_of_money.currency_code = @currency

          order = OnlinePayments::SDK::Domain::Order.new
          order.amount_of_money = amount_of_money

          card_input = OnlinePayments::SDK::Domain::SubsequentCardPaymentMethodSpecificInput.new
          card_input.subsequent_type = @subsequent_type
          card_input.authorization_mode = @authorization_mode

          request = OnlinePayments::SDK::Domain::SubsequentPaymentRequest.new
          request.order = order
          request.subsequentcard_payment_method_specific_input = card_input
          request
        end
      end
    end
  end
end