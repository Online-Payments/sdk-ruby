require 'integration_setup'
require 'integration/util/payment_link/create_payment_link_request_builder'
require 'integration/util/mandates/create_mandate_request_builder'
require 'integration/util/common/create_payment_request_builder'
require 'integration/util/common/create_token_request_builder'
require 'integration/util/hosted_tokenization/create_hosted_tokenization_request_builder'
require 'integration/util/payout/create_payout_request_builder'
require 'onlinepayments/sdk/declined_payment_exception'
require 'integration/util/merchant_batch/submit_batch_request_body_builder'

module Integration
  module Util
    class SdkTestHelper

      def initialize(merchant_client)
        @merchant_client = merchant_client
      end

      def create_payment_link_and_get_id
        @merchant_client.payment_links
                        .create_payment_link(PaymentLink::CreatePaymentLinkRequestBuilder.new.build)
                        .payment_link_id
      end

      def create_token_and_get_id
        @merchant_client.tokens.create_token(Common::CreateTokenRequestBuilder.new.build).token
      end

      def create_hosted_tokenization_and_get_id
        @merchant_client.hosted_tokenization
                        .create_hosted_tokenization(HostedTokenization::CreateHostedTokenizationRequestBuilder.new.build)
                        .hosted_tokenization_id
      end

      def create_payment_and_get_id(amount = nil, currency = nil)
        builder = Common::CreatePaymentRequestBuilder.new
        builder.with_amount(amount) if amount
        builder.with_currency(currency) if currency
        @merchant_client.payments.create_payment(builder.build).payment.id
      end

      def create_pay_pal_payment_and_get_id
        @merchant_client
          .payments
          .create_payment(Common::CreatePaymentRequestBuilder.new.with_pay_pal_redirect_payment_method.build)
          .payment
          .id
      end

      def create_mandate_and_get_reference
        unique_ref = "exampleMandateReference#{Time.now.strftime('%H%M%S%L')}"
        @merchant_client.mandates
                        .create_mandate(Mandates::CreateMandateRequestBuilder.new.with_unique_mandate_reference(unique_ref).build)
                        .mandate
                        .unique_mandate_reference
      end

      def create_payout_and_get_id
        @merchant_client.payouts
                        .create_payout(Integration::Util::Payout::CreatePayoutRequestBuilder.new.build)
                        .id
      end

      def submit_batch_and_get_reference(payment_requests, operation_type, item_count)
        request = Integration::Util::MerchantBatch::SubmitBatchRequestBodyBuilder.new
                                                                                 .with_create_payment_requests(payment_requests)
                                                                                 .with_operation_type(operation_type)
                                                                                 .with_item_count(item_count)
                                                                                 .build

        @merchant_client.merchant_batch
                        .submit_batch(request)
                        .merchant_batch_reference
      end
    end
  end
end
