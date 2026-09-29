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

          # Sets the parameter and returns this same instance.
          def with_locale(value)
            @locale = value
            self
          end

          # Sets the parameter and returns this same instance.
          def with_payment_product_id(value)
            @payment_product_id = value
            self
          end

          # @return [Array<OnlinePayments::SDK::Communication::RequestParam>] representing the attributes of this class
          def to_request_parameters
            result = []
            result << OnlinePayments::SDK::Communication::RequestParam.new('locale', @locale) unless @locale.nil?
            result << OnlinePayments::SDK::Communication::RequestParam.new('paymentProductId', @payment_product_id.to_s) unless @payment_product_id.nil?
            result
          end
        end
      end
    end
  end
end
