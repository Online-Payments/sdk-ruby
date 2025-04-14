#
# This file was automatically generated.
#
require 'onlinepayments/sdk/communication/param_request'
require 'onlinepayments/sdk/communication/request_param'

module OnlinePayments
  module SDK
    module Merchant
      module PrivacyPolicy
        # Query parameters for Get Privacy Policy (/v2/{merchantId}/services/privacypolicy)
        #
        # @attr [String] locale
        # @attr [Integer] payment_product_id
        class GetPrivacyPolicyParams < OnlinePayments::SDK::Communication::ParamRequest

          attr_accessor :locale

          attr_accessor :payment_product_id

          # @return [Array<OnlinePayments::SDK::Communication::RequestParam>] representing the attributes of this class
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
end
