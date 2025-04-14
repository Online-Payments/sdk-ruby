#
# This file was automatically generated.
#
require 'onlinepayments/sdk/api_resource'
require 'onlinepayments/sdk/exception_factory'
require 'onlinepayments/sdk/communication/response_exception'
require 'onlinepayments/sdk/domain/calculate_surcharge_response'
require 'onlinepayments/sdk/domain/currency_conversion_response'
require 'onlinepayments/sdk/domain/error_response'
require 'onlinepayments/sdk/domain/get_iin_details_response'
require 'onlinepayments/sdk/domain/test_connection'

module OnlinePayments
  module SDK
    module Merchant
      module Services
        # Services client. Thread-safe.
        class ServicesClient < OnlinePayments::SDK::ApiResource

          # @param parent       [OnlinePayments::SDK::ApiResource]
          # @param path_context [Hash, nil]
          def initialize(parent, path_context)
            super(parent: parent, path_context: path_context)
          end

          # Resource /v2/!{merchantId}/services/testconnection - Test connection
          #
          # @param context [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::TestConnection]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def test_connection(context = nil)
            uri = instantiate_uri('/v2/{merchantId}/services/testconnection', nil)
            @communicator.get(
              uri,
              client_headers,
              nil,
              OnlinePayments::SDK::Domain::TestConnection,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/services/getIINdetails - Get IIN details
          #
          # @param body    [OnlinePayments::SDK::Domain::GetIINDetailsRequest]
          # @param context [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::GetIINDetailsResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def get_iin_details(body, context = nil)
            uri = instantiate_uri('/v2/{merchantId}/services/getIINdetails', nil)
            @communicator.post(
              uri,
              client_headers,
              nil,
              body,
              OnlinePayments::SDK::Domain::GetIINDetailsResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/services/dccrate - Get currency conversion quote
          #
          # @param body    [OnlinePayments::SDK::Domain::CurrencyConversionRequest]
          # @param context [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::CurrencyConversionResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def get_dcc_rate_inquiry(body, context = nil)
            uri = instantiate_uri('/v2/{merchantId}/services/dccrate', nil)
            @communicator.post(
              uri,
              client_headers,
              nil,
              body,
              OnlinePayments::SDK::Domain::CurrencyConversionResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/services/surchargecalculation - Surcharge Calculation
          #
          # @param body    [OnlinePayments::SDK::Domain::CalculateSurchargeRequest]
          # @param context [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::CalculateSurchargeResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def surcharge_calculation(body, context = nil)
            uri = instantiate_uri('/v2/{merchantId}/services/surchargecalculation', nil)
            @communicator.post(
              uri,
              client_headers,
              nil,
              body,
              OnlinePayments::SDK::Domain::CalculateSurchargeResponse,
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
