#
# This file was automatically generated.
#
require 'onlinepayments/sdk/communication/param_request'
require 'onlinepayments/sdk/communication/request_param'

module OnlinePayments
  module SDK
    module Merchant
      module Products
        # Query parameters for Get payment product networks (/v2/{merchantId}/products/{paymentProductId}/networks)
        #
        # @attr [String] country_code
        # @attr [String] currency_code
        # @attr [Integer] amount
        # @attr [true/false] is_recurring
        class GetPaymentProductNetworksParams < OnlinePayments::SDK::Communication::ParamRequest

          attr_accessor :country_code

          attr_accessor :currency_code

          attr_accessor :amount

          attr_accessor :is_recurring

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
          def with_amount(value)
            @amount = value
            self
          end

          # Sets the parameter and returns this same instance.
          def with_is_recurring(value)
            @is_recurring = value
            self
          end

          # @return [Array<OnlinePayments::SDK::Communication::RequestParam>] representing the attributes of this class
          def to_request_parameters
            result = []
            result << OnlinePayments::SDK::Communication::RequestParam.new('countryCode', @country_code) unless @country_code.nil?
            result << OnlinePayments::SDK::Communication::RequestParam.new('currencyCode', @currency_code) unless @currency_code.nil?
            result << OnlinePayments::SDK::Communication::RequestParam.new('amount', @amount.to_s) unless @amount.nil?
            result << OnlinePayments::SDK::Communication::RequestParam.new('isRecurring', @is_recurring.to_s) unless @is_recurring.nil?
            result
          end
        end
      end
    end
  end
end
