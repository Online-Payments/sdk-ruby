require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/card'
require 'onlinepayments/sdk/domain/card_payout_method_specific_input'
require 'onlinepayments/sdk/domain/create_payout_request'

module Integration
  module Util
    module Payout
      class CreatePayoutRequestBuilder
        def initialize
          @amount = 1000
          @currency_code = 'EUR'
          @card_number = '4012000033330026'
          @cardholder_name = 'Wile E. Coyote'
          @cvv = '123'
          @expiry_date = '1230'
          @payment_product_id = 1
          @payout_reason = 'Refund'
        end

        def with_amount(amount)
          @amount = amount
          self
        end

        def with_currency(currency_code)
          @currency_code = currency_code
          self
        end

        def with_card_number(card_number)
          @card_number = card_number
          self
        end

        def with_cardholder_name(cardholder_name)
          @cardholder_name = cardholder_name
          self
        end

        def with_cvv(cvv)
          @cvv = cvv
          self
        end

        def with_expiry_date(expiry_date)
          @expiry_date = expiry_date
          self
        end

        def with_payment_product_id(payment_product_id)
          @payment_product_id = payment_product_id
          self
        end

        def with_payout_reason(payout_reason)
          @payout_reason = payout_reason
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::CreatePayoutRequest.new
          request.amount_of_money = build_amount_of_money
          request.card_payout_method_specific_input = build_card_payout_method_specific_input
          request
        end

        private

        def build_amount_of_money
          amount = OnlinePayments::SDK::Domain::AmountOfMoney.new
          amount.amount = @amount
          amount.currency_code = @currency_code
          amount
        end

        def build_card_payout_method_specific_input
          input = OnlinePayments::SDK::Domain::CardPayoutMethodSpecificInput.new
          input.card = build_card
          input.payment_product_id = @payment_product_id
          input.payout_reason = @payout_reason
          input
        end

        def build_card
          card = OnlinePayments::SDK::Domain::Card.new
          card.card_number = @card_number
          card.cardholder_name = @cardholder_name
          card.cvv = @cvv
          card.expiry_date = @expiry_date
          card
        end
      end
    end
  end
end
