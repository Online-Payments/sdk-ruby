#
# This file was automatically generated.
#
require 'onlinepayments/sdk/communication/param_request'
require 'onlinepayments/sdk/communication/request_param'

module OnlinePayments
  module SDK
    module Merchant
      module Products
        # Query parameters for Get payment products (/v2/{merchantId}/products)
        #
        # @attr [String] country_code
        # @attr [String] currency_code
        # @attr [String] locale
        # @attr [Integer] amount
        # @attr [true/false] is_recurring
        # @attr [Array<String>] hide
        # @attr [String] operation_type
        class GetPaymentProductsParams < OnlinePayments::SDK::Communication::ParamRequest

          attr_accessor :country_code

          attr_accessor :currency_code

          attr_accessor :locale

          attr_accessor :amount

          attr_accessor :is_recurring

          attr_accessor :hide

          attr_accessor :operation_type

          # Sets the parameter and returns this same instance.
          def with_country_code(value)
            @country_code = value
            self
          end

          # Sets the parameter and returns this same instance.
          def with_currency_code(value)
            @currency_code = value
            self
          end

          # Sets the parameter and returns this same instance.
          def with_locale(value)
            @locale = value
            self
          end

          # Sets the parameter and returns this same instance.
          def with_amount(value)
            @amount = value
            self
          end

          # Sets the parameter and returns this same instance.
          def with_is_recurring(value)
            @is_recurring = value
            self
          end

          # Adds the parameter _value_ to the _hide_ Array
          #
          # @param value [String]
          def add_hide(value)
            unless @hide
              @hide = []
            end
            @hide << value
          end

          # Sets the parameter and returns this same instance.
          def with_hide(value)
            @hide = value
            self
          end

          # Sets the parameter and returns this same instance.
          def with_operation_type(value)
            @operation_type = value
            self
          end

          # @return [Array<OnlinePayments::SDK::Communication::RequestParam>] representing the attributes of this class
          def to_request_parameters
            result = []
            result << OnlinePayments::SDK::Communication::RequestParam.new('countryCode', @country_code) unless @country_code.nil?
            result << OnlinePayments::SDK::Communication::RequestParam.new('currencyCode', @currency_code) unless @currency_code.nil?
            result << OnlinePayments::SDK::Communication::RequestParam.new('locale', @locale) unless @locale.nil?
            result << OnlinePayments::SDK::Communication::RequestParam.new('amount', @amount.to_s) unless @amount.nil?
            result << OnlinePayments::SDK::Communication::RequestParam.new('isRecurring', @is_recurring.to_s) unless @is_recurring.nil?
            unless @hide.nil?
              @hide.each {|e| result << OnlinePayments::SDK::Communication::RequestParam.new('hide', e)}
            end
            result << OnlinePayments::SDK::Communication::RequestParam.new('operationType', @operation_type) unless @operation_type.nil?
            result
          end
        end
      end
    end
  end
end
