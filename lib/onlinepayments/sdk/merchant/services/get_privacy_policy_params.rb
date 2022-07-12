#
# This class was auto-generated.
#
require 'onlinepayments/sdk/param_request'
require 'onlinepayments/sdk/request_param'

module OnlinePayments::SDK
  module Merchant
    module Services

      # Query parameters for 'Get Privacy Policy'.
      # @attr [String] locale
      # @attr [Integer] payment_product_id
      class GetPrivacyPolicyParams < OnlinePayments::SDK::ParamRequest

        attr_accessor :locale

        attr_accessor :payment_product_id

        # @return [Array<OnlinePayments::SDK::RequestParam>] representing the attributes of this class
        def to_request_parameters
          result = []
          result << RequestParam.new('locale', @locale) unless @locale.nil?
          result << RequestParam.new('paymentProductId', @payment_product_id.to_s) unless @payment_product_id.nil?
          result
        end
      end
    end
  end
end
