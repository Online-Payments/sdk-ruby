require 'onlinepayments/sdk/domain/calculate_surcharge_request'
require 'onlinepayments/sdk/domain/card_source'
require 'onlinepayments/sdk/domain/surcharge_calculation_card'
require 'onlinepayments/sdk/domain/amount_of_money'

module Integration
  module Util
    module Services
      class CalculateSurchargeRequestBuilder
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
          surcharge_card = OnlinePayments::SDK::Domain::SurchargeCalculationCard.new
          surcharge_card.card_number = @card_number

          card_source = OnlinePayments::SDK::Domain::CardSource.new
          card_source.card = surcharge_card

          amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
          amount_of_money.amount = @amount
          amount_of_money.currency_code = @currency_code

          request = OnlinePayments::SDK::Domain::CalculateSurchargeRequest.new
          request.card_source = card_source
          request.amount_of_money = amount_of_money
          request
        end
      end
    end
  end
end