#
# This file was automatically generated.
#
require 'onlinepayments/sdk/api_resource'
require 'onlinepayments/sdk/exception_factory'
require 'onlinepayments/sdk/communication/response_exception'
require 'onlinepayments/sdk/domain/created_token_response'
require 'onlinepayments/sdk/domain/error_response'
require 'onlinepayments/sdk/domain/token_response'

module OnlinePayments
  module SDK
    module Merchant
      module Tokens
        # Tokens client. Thread-safe.
        class TokensClient < OnlinePayments::SDK::ApiResource

          # @param parent       [OnlinePayments::SDK::ApiResource]
          # @param path_context [Hash, nil]
          def initialize(parent, path_context)
            super(parent: parent, path_context: path_context)
          end

          # Resource /v2/!{merchantId}/tokens/!{tokenId} - Get token
          #
          # @param token_id [String]
          # @param context  [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::TokenResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def get_token(token_id, context = nil)
            path_context = {
              'tokenId'.freeze => token_id,
            }
            uri = instantiate_uri('/v2/{merchantId}/tokens/{tokenId}', path_context)
            @communicator.get(
              uri,
              client_headers,
              nil,
              OnlinePayments::SDK::Domain::TokenResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/tokens/!{tokenId} - Delete token
          #
          # @param token_id [String]
          # @param context  [OnlinePayments::SDK::CallContext, nil]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def delete_token(token_id, context = nil)
            path_context = {
              'tokenId'.freeze => token_id,
            }
            uri = instantiate_uri('/v2/{merchantId}/tokens/{tokenId}', path_context)
            @communicator.delete(
              uri,
              client_headers,
              nil,
              nil,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/tokens - Create token
          #
          # @param body    [OnlinePayments::SDK::Domain::CreateTokenRequest]
          # @param context [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::CreatedTokenResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def create_token(body, context = nil)
            uri = instantiate_uri('/v2/{merchantId}/tokens', nil)
            @communicator.post(
              uri,
              client_headers,
              nil,
              body,
              OnlinePayments::SDK::Domain::CreatedTokenResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end
        end
      end
    end
  end
end
