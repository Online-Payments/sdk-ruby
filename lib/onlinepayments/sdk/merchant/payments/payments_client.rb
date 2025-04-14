#
# This file was automatically generated.
#
require 'onlinepayments/sdk/api_resource'
require 'onlinepayments/sdk/exception_factory'
require 'onlinepayments/sdk/communication/response_exception'
require 'onlinepayments/sdk/domain/cancel_payment_response'
require 'onlinepayments/sdk/domain/capture_response'
require 'onlinepayments/sdk/domain/create_payment_response'
require 'onlinepayments/sdk/domain/error_response'
require 'onlinepayments/sdk/domain/payment_details_response'
require 'onlinepayments/sdk/domain/payment_error_response'
require 'onlinepayments/sdk/domain/payment_response'
require 'onlinepayments/sdk/domain/refund_error_response'
require 'onlinepayments/sdk/domain/refund_response'
require 'onlinepayments/sdk/domain/subsequent_payment_response'

module OnlinePayments
  module SDK
    module Merchant
      module Payments
        # Payments client. Thread-safe.
        class PaymentsClient < OnlinePayments::SDK::ApiResource

          # @param parent       [OnlinePayments::SDK::ApiResource]
          # @param path_context [Hash, nil]
          def initialize(parent, path_context)
            super(parent: parent, path_context: path_context)
          end

          # Resource /v2/!{merchantId}/payments - Create payment
          #
          # @param body    [OnlinePayments::SDK::Domain::CreatePaymentRequest]
          # @param context [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::CreatePaymentResponse]
          # @raise [OnlinePayments::SDK::DeclinedPaymentException] if the payment platform declined / rejected the payment. The payment result will be available from the exception.
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def create_payment(body, context = nil)
            uri = instantiate_uri('/v2/{merchantId}/payments', nil)
            @communicator.post(
              uri,
              client_headers,
              nil,
              body,
              OnlinePayments::SDK::Domain::CreatePaymentResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::PaymentErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/payments/!{paymentId} - Get payment
          #
          # @param payment_id [String]
          # @param context    [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::PaymentResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def get_payment(payment_id, context = nil)
            path_context = {
              'paymentId'.freeze => payment_id,
            }
            uri = instantiate_uri('/v2/{merchantId}/payments/{paymentId}', path_context)
            @communicator.get(
              uri,
              client_headers,
              nil,
              OnlinePayments::SDK::Domain::PaymentResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/payments/!{paymentId}/details - Get payment details
          #
          # @param payment_id [String]
          # @param context    [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::PaymentDetailsResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def get_payment_details(payment_id, context = nil)
            path_context = {
              'paymentId'.freeze => payment_id,
            }
            uri = instantiate_uri('/v2/{merchantId}/payments/{paymentId}/details', path_context)
            @communicator.get(
              uri,
              client_headers,
              nil,
              OnlinePayments::SDK::Domain::PaymentDetailsResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/payments/!{paymentId}/cancel - Cancel payment
          #
          # @param payment_id [String]
          # @param body       [OnlinePayments::SDK::Domain::CancelPaymentRequest]
          # @param context    [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::CancelPaymentResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def cancel_payment(payment_id, body, context = nil)
            path_context = {
              'paymentId'.freeze => payment_id,
            }
            uri = instantiate_uri('/v2/{merchantId}/payments/{paymentId}/cancel', path_context)
            @communicator.post(
              uri,
              client_headers,
              nil,
              body,
              OnlinePayments::SDK::Domain::CancelPaymentResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/payments/!{paymentId}/capture - Capture payment
          #
          # @param payment_id [String]
          # @param body       [OnlinePayments::SDK::Domain::CapturePaymentRequest]
          # @param context    [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::CaptureResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def capture_payment(payment_id, body, context = nil)
            path_context = {
              'paymentId'.freeze => payment_id,
            }
            uri = instantiate_uri('/v2/{merchantId}/payments/{paymentId}/capture', path_context)
            @communicator.post(
              uri,
              client_headers,
              nil,
              body,
              OnlinePayments::SDK::Domain::CaptureResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/payments/!{paymentId}/refund - Refund payment
          #
          # @param payment_id [String]
          # @param body       [OnlinePayments::SDK::Domain::RefundRequest]
          # @param context    [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::RefundResponse]
          # @raise [OnlinePayments::SDK::DeclinedRefundException] if the payment platform declined / rejected the refund. The refund result will be available from the exception.
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def refund_payment(payment_id, body, context = nil)
            path_context = {
              'paymentId'.freeze => payment_id,
            }
            uri = instantiate_uri('/v2/{merchantId}/payments/{paymentId}/refund', path_context)
            @communicator.post(
              uri,
              client_headers,
              nil,
              body,
              OnlinePayments::SDK::Domain::RefundResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::RefundErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/payments/!{paymentId}/subsequent - Subsequent payment
          #
          # @param payment_id [String]
          # @param body       [OnlinePayments::SDK::Domain::SubsequentPaymentRequest]
          # @param context    [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::SubsequentPaymentResponse]
          # @raise [OnlinePayments::SDK::DeclinedPaymentException] if the payment platform declined / rejected the payment. The payment result will be available from the exception.
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def subsequent_payment(payment_id, body, context = nil)
            path_context = {
              'paymentId'.freeze => payment_id,
            }
            uri = instantiate_uri('/v2/{merchantId}/payments/{paymentId}/subsequent', path_context)
            @communicator.post(
              uri,
              client_headers,
              nil,
              body,
              OnlinePayments::SDK::Domain::SubsequentPaymentResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::PaymentErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end
        end
      end
    end
  end
end
