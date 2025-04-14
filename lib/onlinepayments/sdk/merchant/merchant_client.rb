#
# This file was automatically generated.
#
require 'onlinepayments/sdk/api_resource'
require 'onlinepayments/sdk/merchant/captures/captures_client'
require 'onlinepayments/sdk/merchant/complete/complete_client'
require 'onlinepayments/sdk/merchant/hostedcheckout/hosted_checkout_client'
require 'onlinepayments/sdk/merchant/hostedtokenization/hosted_tokenization_client'
require 'onlinepayments/sdk/merchant/mandates/mandates_client'
require 'onlinepayments/sdk/merchant/paymentlinks/payment_links_client'
require 'onlinepayments/sdk/merchant/payments/payments_client'
require 'onlinepayments/sdk/merchant/payouts/payouts_client'
require 'onlinepayments/sdk/merchant/privacypolicy/privacy_policy_client'
require 'onlinepayments/sdk/merchant/productgroups/product_groups_client'
require 'onlinepayments/sdk/merchant/products/products_client'
require 'onlinepayments/sdk/merchant/refunds/refunds_client'
require 'onlinepayments/sdk/merchant/services/services_client'
require 'onlinepayments/sdk/merchant/sessions/sessions_client'
require 'onlinepayments/sdk/merchant/tokens/tokens_client'
require 'onlinepayments/sdk/merchant/webhooks/webhooks_client'

module OnlinePayments
  module SDK
    module Merchant
      # Merchant client. Thread-safe.
      class MerchantClient < OnlinePayments::SDK::ApiResource

        # @param parent       [OnlinePayments::SDK::ApiResource]
        # @param path_context [Hash, nil]
        def initialize(parent, path_context)
          super(parent: parent, path_context: path_context)
        end

        # Resource /v2/{merchantId}/hostedcheckouts
        #
        # @return [OnlinePayments::SDK::Merchant::HostedCheckout::HostedCheckoutClient]
        def hosted_checkout
          OnlinePayments::SDK::Merchant::HostedCheckout::HostedCheckoutClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/hostedtokenizations
        #
        # @return [OnlinePayments::SDK::Merchant::HostedTokenization::HostedTokenizationClient]
        def hosted_tokenization
          OnlinePayments::SDK::Merchant::HostedTokenization::HostedTokenizationClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/payments
        #
        # @return [OnlinePayments::SDK::Merchant::Payments::PaymentsClient]
        def payments
          OnlinePayments::SDK::Merchant::Payments::PaymentsClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/payments/{paymentId}/captures
        #
        # @return [OnlinePayments::SDK::Merchant::Captures::CapturesClient]
        def captures
          OnlinePayments::SDK::Merchant::Captures::CapturesClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/payments/{paymentId}/refunds
        #
        # @return [OnlinePayments::SDK::Merchant::Refunds::RefundsClient]
        def refunds
          OnlinePayments::SDK::Merchant::Refunds::RefundsClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/payments/{paymentId}/complete
        #
        # @return [OnlinePayments::SDK::Merchant::Complete::CompleteClient]
        def complete
          OnlinePayments::SDK::Merchant::Complete::CompleteClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/productgroups
        #
        # @return [OnlinePayments::SDK::Merchant::ProductGroups::ProductGroupsClient]
        def product_groups
          OnlinePayments::SDK::Merchant::ProductGroups::ProductGroupsClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/products
        #
        # @return [OnlinePayments::SDK::Merchant::Products::ProductsClient]
        def products
          OnlinePayments::SDK::Merchant::Products::ProductsClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/services/testconnection
        #
        # @return [OnlinePayments::SDK::Merchant::Services::ServicesClient]
        def services
          OnlinePayments::SDK::Merchant::Services::ServicesClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/webhooks/validateCredentials
        #
        # @return [OnlinePayments::SDK::Merchant::Webhooks::WebhooksClient]
        def webhooks
          OnlinePayments::SDK::Merchant::Webhooks::WebhooksClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/sessions
        #
        # @return [OnlinePayments::SDK::Merchant::Sessions::SessionsClient]
        def sessions
          OnlinePayments::SDK::Merchant::Sessions::SessionsClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/tokens/{tokenId}
        #
        # @return [OnlinePayments::SDK::Merchant::Tokens::TokensClient]
        def tokens
          OnlinePayments::SDK::Merchant::Tokens::TokensClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/payouts/{payoutId}
        #
        # @return [OnlinePayments::SDK::Merchant::Payouts::PayoutsClient]
        def payouts
          OnlinePayments::SDK::Merchant::Payouts::PayoutsClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/mandates
        #
        # @return [OnlinePayments::SDK::Merchant::Mandates::MandatesClient]
        def mandates
          OnlinePayments::SDK::Merchant::Mandates::MandatesClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/services/privacypolicy
        #
        # @return [OnlinePayments::SDK::Merchant::PrivacyPolicy::PrivacyPolicyClient]
        def privacy_policy
          OnlinePayments::SDK::Merchant::PrivacyPolicy::PrivacyPolicyClient.new(self, nil)
        end

        # Resource /v2/{merchantId}/paymentlinks
        #
        # @return [OnlinePayments::SDK::Merchant::PaymentLinks::PaymentLinksClient]
        def payment_links
          OnlinePayments::SDK::Merchant::PaymentLinks::PaymentLinksClient.new(self, nil)
        end
      end
    end
  end
end
