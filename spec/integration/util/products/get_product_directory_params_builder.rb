require 'onlinepayments/sdk/merchant/products/get_product_directory_params'

module Integration
  module Util
    module Products
      class GetProductDirectoryParamsBuilder
        def initialize
          @country_code = nil
          @currency_code = nil
        end

        def with_country_code(country_code)
          @country_code = country_code
          self
        end

        def with_currency_code(currency_code)
          @currency_code = currency_code
          self
        end

        def build
          params = OnlinePayments::SDK::Merchant::Products::GetProductDirectoryParams.new

          params.country_code = @country_code unless @country_code.nil?
          params.currency_code = @currency_code unless @currency_code.nil?

          params
        end
      end
    end
  end
end