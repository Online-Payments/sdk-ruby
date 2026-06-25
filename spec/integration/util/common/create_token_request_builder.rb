require 'onlinepayments/sdk/domain/card'
require 'onlinepayments/sdk/domain/create_token_request'
require 'onlinepayments/sdk/domain/token_card_specific_input'
require 'onlinepayments/sdk/domain/token_data'

module Integration
  module Util
    module Common
      class CreateTokenRequestBuilder

        def initialize
          @card_number = '4567350000427977'
          @cvv = '123'
          @expiry_date = '1230'
          @cardholder_name = 'John Doe'
          @payment_product_id = 1
          @encrypted_customer_input = nil
          @cobrand_selection_indicator = nil
        end

        def with_card_number(card_number)
          @card_number = card_number
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

        def with_cardholder_name(cardholder_name)
          @cardholder_name = cardholder_name
          self
        end

        def with_payment_product_id(payment_product_id)
          @payment_product_id = payment_product_id
          self
        end

        def with_encrypted_customer_input(encrypted_customer_input)
          @encrypted_customer_input = encrypted_customer_input
          self
        end

        def with_cobrand_selection_indicator(cobrand_selection_indicator)
          @cobrand_selection_indicator = cobrand_selection_indicator
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::CreateTokenRequest.new
          request.payment_product_id = @payment_product_id

          if @encrypted_customer_input
            request.encrypted_customer_input = @encrypted_customer_input
          else
            request.card = build_card_token
          end

          request
        end

        private

        def build_card_token
          input = OnlinePayments::SDK::Domain::TokenCardSpecificInput.new
          input.data = build_token_data
          input
        end

        def build_token_data
          token_data = OnlinePayments::SDK::Domain::TokenData.new
          token_data.card = build_card
          token_data.cobrand_selection_indicator = @cobrand_selection_indicator if @cobrand_selection_indicator
          token_data
        end

        def build_card
          card = OnlinePayments::SDK::Domain::Card.new
          card.cardholder_name = @cardholder_name
          card.cvv = @cvv
          card.card_number = @card_number
          card.expiry_date = @expiry_date
          card
        end
      end
    end
  end
end
