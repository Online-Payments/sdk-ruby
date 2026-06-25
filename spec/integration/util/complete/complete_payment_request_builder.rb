require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/complete_payment_card_payment_method_specific_input'
require 'onlinepayments/sdk/domain/complete_payment_request'
require 'onlinepayments/sdk/domain/order'

module Integration
  module Util
    module Complete
      class CompletePaymentRequestBuilder

        def initialize
          @amount = 1000
          @currency = 'EUR'
          @card_number = nil
          @cardholder_name = nil
          @expiry_date = nil
          @order_override = nil
          @use_order_override = false
        end

        def with_amount(amount)
          @amount = amount
          self
        end

        def with_currency(currency)
          @currency = currency
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

        def with_expiry_date(expiry_date)
          @expiry_date = expiry_date
          self
        end

        def with_order(order)
          @order_override = order
          @use_order_override = true
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::CompletePaymentRequest.new
          request.order = @use_order_override ? @order_override : build_order

          if @card_number || @cardholder_name || @expiry_date
            request.card_payment_method_specific_input = build_card_payment_method_specific_input
          end

          request
        end

        private

        def build_order
          order = OnlinePayments::SDK::Domain::Order.new
          order.amount_of_money = build_amount_of_money
          order
        end

        def build_amount_of_money
          amount = OnlinePayments::SDK::Domain::AmountOfMoney.new
          amount.amount = @amount
          amount.currency_code = @currency
          amount
        end

        def build_card_payment_method_specific_input
          input = OnlinePayments::SDK::Domain::CompletePaymentCardPaymentMethodSpecificInput.new
          input.card = build_card
          input
        end

        def build_card
          card = OnlinePayments::SDK::Domain::CardWithoutCvv.new
          card.card_number = @card_number if @card_number
          card.cardholder_name = @cardholder_name if @cardholder_name
          card.expiry_date = @expiry_date if @expiry_date
          card
        end
      end
    end
  end
end
