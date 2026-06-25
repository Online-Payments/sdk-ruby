require 'onlinepayments/sdk/merchant/products/get_payment_product_networks_params'

module Integration
  module Util
    module Products
      class GetPaymentProductNetworksParamsBuilder
        def initialize
          @country_code = nil
          @currency_code = nil
          @amount = nil
          @is_recurring = nil
        end

        def with_country_code(country_code)
          @country_code = country_code
          self
        end

        def with_currency_code(currency_code)
          @currency_code = currency_code
          self
        end

        def with_amount(amount)
          @amount = amount
          self
        end

        def with_is_recurring(is_recurring)
          @is_recurring = is_recurring
          self
        end

        def build
          params = OnlinePayments::SDK::Merchant::Products::GetPaymentProductNetworksParams.new

          params.country_code = @country_code unless @country_code.nil?
          params.currency_code = @currency_code unless @currency_code.nil?
          params.amount = @amount unless @amount.nil?
          params.is_recurring = @is_recurring unless @is_recurring.nil?

          params
        end
      end
    end
  end
end