#
# This class was auto-generated.
#
require 'onlinepayments/sdk/api_resource'
require 'onlinepayments/sdk/response_exception'
require 'onlinepayments/sdk/domain/create_payout_request'
require 'onlinepayments/sdk/domain/error_response'
require 'onlinepayments/sdk/domain/payout_error_response'
require 'onlinepayments/sdk/domain/payout_response'

module OnlinePayments::SDK
  module Merchant
    module Payouts

      # Payouts client. Thread-safe.
      class PayoutsClient < OnlinePayments::SDK::ApiResource

        # @param parent        [OnlinePayments::SDK::ApiResource]
        # @param path_context  [Hash, nil]
        def initialize(parent, path_context = nil)
          super(parent, path_context)
        end

        # Resource /v2/!{merchantId}/payouts
        # @param body    [OnlinePayments::SDK::Domain::CreatePayoutRequest]
        # @param context [OnlinePayments::SDK::CallContext]
        # @return [OnlinePayments::SDK::Domain::PayoutResponse]
        # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
        # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
        # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
        # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
        #        or there was a conflict (HTTP status code 404, 409 or 410)
        # @raise [OnlinePayments::SDK::PaymentPlatformException] if something went wrong at the payment platform,
        #        the payment platform was unable to process a message from a downstream partner/acquirer,
        #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
        # @raise [OnlinePayments::SDK::ApiException]if the payment platform returned any other error
        def create_payout(body, context = nil)
          uri = instantiate_uri('/v2/{merchantId}/payouts')
          @communicator.post(
            uri,
            client_headers,
            nil,
            body,
            OnlinePayments::SDK::Domain::PayoutResponse,
            context
          )
        rescue ResponseException => e
          error_type = OnlinePayments::SDK::Domain::PayoutErrorResponse
          error_object = @communicator.marshaller.unmarshal(e.body, error_type)
          raise create_exception(e.status_code, e.body, error_object, context)
        end

        # Resource /v2/!{merchantId}/payouts/!{payoutId}
        # @param payout_id [String]
        # @param context   [OnlinePayments::SDK::CallContext]
        # @return [OnlinePayments::SDK::Domain::PayoutResponse]
        # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
        # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
        # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
        # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
        #        or there was a conflict (HTTP status code 404, 409 or 410)
        # @raise [OnlinePayments::SDK::PaymentPlatformException] if something went wrong at the payment platform,
        #        the payment platform was unable to process a message from a downstream partner/acquirer,
        #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
        # @raise [OnlinePayments::SDK::ApiException]if the payment platform returned any other error
        def get_payout(payout_id, context = nil)
          path_context = {
            'payoutId'.freeze => payout_id,
          }
          uri = instantiate_uri('/v2/{merchantId}/payouts/{payoutId}', path_context)
          @communicator.get(
            uri,
            client_headers,
            nil,
            OnlinePayments::SDK::Domain::PayoutResponse,
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
