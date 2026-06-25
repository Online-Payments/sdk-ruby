require 'onlinepayments/sdk/merchant/privacypolicy/get_privacy_policy_params'

module Integration
  module Util
    module PrivacyPolicy
      class GetPrivacyPolicyParamsBuilder

        def initialize
          @locale = 'en_US'
          @payment_product_id = nil
        end

        def with_locale(locale)
          @locale = locale
          self
        end

        def with_payment_product_id(payment_product_id)
          @payment_product_id = payment_product_id
          self
        end

        def with_english_locale
          @locale = 'en_US'
          self
        end

        def with_dutch_locale
          @locale = 'nl_NL'
          self
        end

        def with_french_locale
          @locale = 'fr_FR'
          self
        end

        def with_german_locale
          @locale = 'de_DE'
          self
        end

        def with_visa_product
          @payment_product_id = 1
          self
        end

        def with_american_express_product
          @payment_product_id = 2
          self
        end

        def with_master_card_product
          @payment_product_id = 3
          self
        end

        def build
          params = OnlinePayments::SDK::Merchant::PrivacyPolicy::GetPrivacyPolicyParams.new
          params.locale = @locale
          params.payment_product_id = @payment_product_id if @payment_product_id
          params
        end
      end
    end
  end
end
