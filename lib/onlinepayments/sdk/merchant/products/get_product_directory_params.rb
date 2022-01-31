#
# This class was auto-generated.
#
require 'onlinepayments/sdk/param_request'
require 'onlinepayments/sdk/request_param'

module OnlinePayments::SDK
  module Merchant
    module Products

      # Query parameters for 'Get payment product directory'.
      # @attr [String] country_code
      # @attr [String] currency_code
      class GetProductDirectoryParams < OnlinePayments::SDK::ParamRequest

        attr_accessor :country_code

        attr_accessor :currency_code

        # @return [Array<OnlinePayments::SDK::RequestParam>] representing the attributes of this class
        def to_request_parameters
          result = []
          result << RequestParam.new('countryCode', @country_code) unless @country_code.nil?
          result << RequestParam.new('currencyCode', @currency_code) unless @currency_code.nil?
          result
        end
      end
    end
  end
end
