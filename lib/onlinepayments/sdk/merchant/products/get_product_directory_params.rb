#
# This file was automatically generated.
#
require 'onlinepayments/sdk/communication/param_request'
require 'onlinepayments/sdk/communication/request_param'

module OnlinePayments
  module SDK
    module Merchant
      module Products
        # Query parameters for Get payment product directory (/v2/{merchantId}/products/{paymentProductId}/directory)
        #
        # @attr [String] country_code
        # @attr [String] currency_code
        class GetProductDirectoryParams < OnlinePayments::SDK::Communication::ParamRequest

          attr_accessor :country_code

          attr_accessor :currency_code

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

          # @return [Array<OnlinePayments::SDK::Communication::RequestParam>] representing the attributes of this class
          def to_request_parameters
            result = []
            result << OnlinePayments::SDK::Communication::RequestParam.new('countryCode', @country_code) unless @country_code.nil?
            result << OnlinePayments::SDK::Communication::RequestParam.new('currencyCode', @currency_code) unless @currency_code.nil?
            result
          end
        end
      end
    end
  end
end
