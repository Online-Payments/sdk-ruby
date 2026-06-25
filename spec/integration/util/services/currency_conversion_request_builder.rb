require 'onlinepayments/sdk/domain/currency_conversion_request'
require 'onlinepayments/sdk/domain/dcc_card_source'
require 'onlinepayments/sdk/domain/card_info'
require 'onlinepayments/sdk/domain/transaction'
require 'onlinepayments/sdk/domain/amount_of_money'

module Integration
  module Util
    module Services
      class CurrencyConversionRequestBuilder
        def initialize
          @card_number = nil
          @amount = 1000
          @currency_code = 'EUR'
        end

        def with_card_number(card_number)
          @card_number = card_number
          self
        end

        def with_amount(amount)
          @amount = amount
          self
        end

        def with_currency_code(currency_code)
          @currency_code = currency_code
          self
        end

        def build
          card_info = OnlinePayments::SDK::Domain::CardInfo.new
          card_info.card_number = @card_number

          card_source = OnlinePayments::SDK::Domain::DccCardSource.new
          card_source.card = card_info

          amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
          amount_of_money.amount = @amount
          amount_of_money.currency_code = @currency_code

          transaction = OnlinePayments::SDK::Domain::Transaction.new
          transaction.amount = amount_of_money

          request = OnlinePayments::SDK::Domain::CurrencyConversionRequest.new
          request.card_source = card_source
          request.transaction = transaction
          request
        end
      end
    end
  end
end