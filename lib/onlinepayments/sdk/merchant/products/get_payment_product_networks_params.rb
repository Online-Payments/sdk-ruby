#
# This class was auto-generated.
#
require 'onlinepayments/sdk/param_request'
require 'onlinepayments/sdk/request_param'

module OnlinePayments::SDK
  module Merchant
    module Products

      # Query parameters for 'Get payment product networks'.
      # @attr [String] country_code
      # @attr [String] currency_code
      # @attr [Integer] amount
      # @attr [true/false] is_recurring
      class GetPaymentProductNetworksParams < OnlinePayments::SDK::ParamRequest

        attr_accessor :country_code

        attr_accessor :currency_code

        attr_accessor :amount

        attr_accessor :is_recurring

        # @return [Array<OnlinePayments::SDK::RequestParam>] representing the attributes of this class
        def to_request_parameters
          result = []
          result << RequestParam.new('countryCode', @country_code) unless @country_code.nil?
          result << RequestParam.new('currencyCode', @currency_code) unless @currency_code.nil?
          result << RequestParam.new('amount', @amount.to_s) unless @amount.nil?
          result << RequestParam.new('isRecurring', @is_recurring.to_s) unless @is_recurring.nil?
          result
        end
      end
    end
  end
end
