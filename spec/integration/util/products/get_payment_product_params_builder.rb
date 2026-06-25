require 'onlinepayments/sdk/merchant/products/get_payment_product_params'

module Integration
  module Util
    module Products
      class GetPaymentProductParamsBuilder
        def initialize
          @country_code = nil
          @currency_code = nil
          @locale = nil
          @amount = nil
          @is_recurring = nil
          @hide_list = []
          @operation_type = nil
        end

        def with_country_code(country_code)
          @country_code = country_code
          self
        end

        def with_currency_code(currency_code)
          @currency_code = currency_code
          self
        end

        def with_locale(locale)
          @locale = locale
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

        def with_hide(hide)
          @hide_list << hide
          self
        end

        def with_hide_list(hide_list)
          @hide_list = hide_list
          self
        end

        def with_operation_type(operation_type)
          @operation_type = operation_type
          self
        end

        def build
          params = OnlinePayments::SDK::Merchant::Products::GetPaymentProductParams.new

          params.country_code = @country_code unless @country_code.nil?
          params.currency_code = @currency_code unless @currency_code.nil?
          params.locale = @locale unless @locale.nil?
          params.amount = @amount unless @amount.nil?
          params.is_recurring = @is_recurring unless @is_recurring.nil?

          @hide_list.each { |s| params.add_hide(s) } unless @hide_list.empty?
          params.operation_type = @operation_type unless @operation_type.nil?

          params
        end
      end
    end
  end
end
