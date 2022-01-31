#
# This class was auto-generated.
#
require 'onlinepayments/sdk/api_resource'
require 'onlinepayments/sdk/response_exception'
require 'onlinepayments/sdk/domain/create_hosted_checkout_request'
require 'onlinepayments/sdk/domain/create_hosted_checkout_response'
require 'onlinepayments/sdk/domain/error_response'
require 'onlinepayments/sdk/domain/get_hosted_checkout_response'

module OnlinePayments::SDK
  module Merchant
    module HostedCheckout

      # HostedCheckout client. Thread-safe.
      class HostedCheckoutClient < OnlinePayments::SDK::ApiResource

        # @param parent        [OnlinePayments::SDK::ApiResource]
        # @param path_context  [Hash, nil]
        def initialize(parent, path_context = nil)
          super(parent, path_context)
        end

        # Resource /v2/!{merchantId}/hostedcheckouts
        # @param body    [OnlinePayments::SDK::Domain::CreateHostedCheckoutRequest]
        # @param context [OnlinePayments::SDK::CallContext]
        # @return [OnlinePayments::SDK::Domain::CreateHostedCheckoutResponse]
        # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
        # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
        # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
        # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
        #        or there was a conflict (HTTP status code 404, 409 or 410)
        # @raise [OnlinePayments::SDK::PaymentPlatformException] if something went wrong at the payment platform,
        #        the payment platform was unable to process a message from a downstream partner/acquirer,
        #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
        # @raise [OnlinePayments::SDK::ApiException]if the payment platform returned any other error
        def create_hosted_checkout(body, context = nil)
          uri = instantiate_uri('/v2/{merchantId}/hostedcheckouts')
          @communicator.post(
            uri,
            client_headers,
            nil,
            body,
            OnlinePayments::SDK::Domain::CreateHostedCheckoutResponse,
            context
          )
        rescue ResponseException => e
          error_type = OnlinePayments::SDK::Domain::ErrorResponse
          error_object = @communicator.marshaller.unmarshal(e.body, error_type)
          raise create_exception(e.status_code, e.body, error_object, context)
        end

        # Resource /v2/!{merchantId}/hostedcheckouts/!{hostedCheckoutId}
        # @param hosted_checkout_id [String]
        # @param context            [OnlinePayments::SDK::CallContext]
        # @return [OnlinePayments::SDK::Domain::GetHostedCheckoutResponse]
        # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
        # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
        # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
        # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
        #        or there was a conflict (HTTP status code 404, 409 or 410)
        # @raise [OnlinePayments::SDK::PaymentPlatformException] if something went wrong at the payment platform,
        #        the payment platform was unable to process a message from a downstream partner/acquirer,
        #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
        # @raise [OnlinePayments::SDK::ApiException]if the payment platform returned any other error
        def get_hosted_checkout(hosted_checkout_id, context = nil)
          path_context = {
            'hostedCheckoutId'.freeze => hosted_checkout_id,
          }
          uri = instantiate_uri('/v2/{merchantId}/hostedcheckouts/{hostedCheckoutId}', path_context)
          @communicator.get(
            uri,
            client_headers,
            nil,
            OnlinePayments::SDK::Domain::GetHostedCheckoutResponse,
            context
          )
        rescue ResponseException => e
          error_type = OnlinePayments::SDK::Domain::ErrorResponse
          error_object = @communicator.marshaller.unmarshal(e.body, error_type)
          raise create_exception(e.status_code, e.body, error_object, context)
        end
      end
    end
  end
end
