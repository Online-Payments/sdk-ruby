#
# This file was automatically generated.
#
require 'onlinepayments/sdk/api_resource'
require 'onlinepayments/sdk/exception_factory'
require 'onlinepayments/sdk/communication/response_exception'
require 'onlinepayments/sdk/domain/create_mandate_response'
require 'onlinepayments/sdk/domain/error_response'
require 'onlinepayments/sdk/domain/get_mandate_response'

module OnlinePayments
  module SDK
    module Merchant
      module Mandates
        # Mandates client. Thread-safe.
        class MandatesClient < OnlinePayments::SDK::ApiResource

          # @param parent       [OnlinePayments::SDK::ApiResource]
          # @param path_context [Hash, nil]
          def initialize(parent, path_context)
            super(parent: parent, path_context: path_context)
          end

          # Resource /v2/!{merchantId}/mandates - Create mandate
          #
          # @param body    [OnlinePayments::SDK::Domain::CreateMandateRequest]
          # @param context [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::CreateMandateResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def create_mandate(body, context = nil)
            uri = instantiate_uri('/v2/{merchantId}/mandates', nil)
            @communicator.post(
              uri,
              client_headers,
              nil,
              body,
              OnlinePayments::SDK::Domain::CreateMandateResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/mandates/!{uniqueMandateReference} - Get mandate
          #
          # @param unique_mandate_reference [String]
          # @param context                  [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::GetMandateResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def get_mandate(unique_mandate_reference, context = nil)
            path_context = {
              'uniqueMandateReference'.freeze => unique_mandate_reference,
            }
            uri = instantiate_uri('/v2/{merchantId}/mandates/{uniqueMandateReference}', path_context)
            @communicator.get(
              uri,
              client_headers,
              nil,
              OnlinePayments::SDK::Domain::GetMandateResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/mandates/!{uniqueMandateReference}/block - Block mandate
          #
          # @param unique_mandate_reference [String]
          # @param context                  [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::GetMandateResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def block_mandate(unique_mandate_reference, context = nil)
            path_context = {
              'uniqueMandateReference'.freeze => unique_mandate_reference,
            }
            uri = instantiate_uri('/v2/{merchantId}/mandates/{uniqueMandateReference}/block', path_context)
            @communicator.post(
              uri,
              client_headers,
              nil,
              nil,
              OnlinePayments::SDK::Domain::GetMandateResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/mandates/!{uniqueMandateReference}/unblock - Unblock mandate
          #
          # @param unique_mandate_reference [String]
          # @param context                  [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::GetMandateResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def unblock_mandate(unique_mandate_reference, context = nil)
            path_context = {
              'uniqueMandateReference'.freeze => unique_mandate_reference,
            }
            uri = instantiate_uri('/v2/{merchantId}/mandates/{uniqueMandateReference}/unblock', path_context)
            @communicator.post(
              uri,
              client_headers,
              nil,
              nil,
              OnlinePayments::SDK::Domain::GetMandateResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/mandates/!{uniqueMandateReference}/revoke - Revoke mandate
          #
          # @param unique_mandate_reference [String]
          # @param context                  [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::GetMandateResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def revoke_mandate(unique_mandate_reference, context = nil)
            path_context = {
              'uniqueMandateReference'.freeze => unique_mandate_reference,
            }
            uri = instantiate_uri('/v2/{merchantId}/mandates/{uniqueMandateReference}/revoke', path_context)
            @communicator.post(
              uri,
              client_headers,
              nil,
              nil,
              OnlinePayments::SDK::Domain::GetMandateResponse,
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
