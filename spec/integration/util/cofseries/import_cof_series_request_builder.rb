require 'onlinepayments/sdk/domain/card_data_without_cvv'
require 'onlinepayments/sdk/domain/import_cof_series_request'

module Integration
  module Util
    module CofSeries
      class ImportCofSeriesRequestBuilder

        def initialize
          @card_number = '4567350000427977'
          @cardholder_name = 'John Doe'
          @expiry_date = '1230'
          @currency_code = 'EUR'
          @payment_product_id = 1
          @scheme_reference_data = 'test_scheme_reference'
          @token_id = nil
          @transaction_link_identifier = nil
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

        def with_currency_code(currency_code)
          @currency_code = currency_code
          self
        end

        def with_payment_product_id(payment_product_id)
          @payment_product_id = payment_product_id
          self
        end

        def with_scheme_reference_data(scheme_reference_data)
          @scheme_reference_data = scheme_reference_data
          self
        end

        def with_token_id(token_id)
          @token_id = token_id
          self
        end

        def with_transaction_link_identifier(transaction_link_identifier)
          @transaction_link_identifier = transaction_link_identifier
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::ImportCofSeriesRequest.new
          request.currency_code = @currency_code
          request.payment_product_id = @payment_product_id
          request.scheme_reference_data = @scheme_reference_data
          request.transaction_link_identifier = @transaction_link_identifier unless @transaction_link_identifier.nil?

          if @token_id
            request.token_id = @token_id
          else
            request.card = build_card
          end

          request
        end

        private

        def build_card
          card = OnlinePayments::SDK::Domain::CardDataWithoutCvv.new
          card.card_number = @card_number
          card.cardholder_name = @cardholder_name
          card.expiry_date = @expiry_date
          card
        end
      end
    end
  end
end
