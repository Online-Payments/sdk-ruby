#
# This class was auto-generated.
#
require 'onlinepayments/sdk/api_resource'
require 'onlinepayments/sdk/response_exception'
require 'onlinepayments/sdk/domain/error_response'
require 'onlinepayments/sdk/domain/get_payment_products_response'
require 'onlinepayments/sdk/domain/payment_product'
require 'onlinepayments/sdk/domain/payment_product_networks_response'
require 'onlinepayments/sdk/domain/product_directory'
require 'onlinepayments/sdk/merchant/products/get_payment_product_networks_params'
require 'onlinepayments/sdk/merchant/products/get_payment_product_params'
require 'onlinepayments/sdk/merchant/products/get_payment_products_params'
require 'onlinepayments/sdk/merchant/products/get_product_directory_params'

module OnlinePayments::SDK
  module Merchant
    module Products

      # Products client. Thread-safe.
      class ProductsClient < OnlinePayments::SDK::ApiResource

        # @param parent        [OnlinePayments::SDK::ApiResource]
        # @param path_context  [Hash, nil]
        def initialize(parent, path_context = nil)
          super(parent, path_context)
        end

        # Resource /v2/!{merchantId}/products
        # @param query   [OnlinePayments::SDK::Merchant::Products::GetPaymentProductsParams]
        # @param context [OnlinePayments::SDK::CallContext]
        # @return [OnlinePayments::SDK::Domain::GetPaymentProductsResponse]
        # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
        # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
        # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
        # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
        #        or there was a conflict (HTTP status code 404, 409 or 410)
        # @raise [OnlinePayments::SDK::PaymentPlatformException] if something went wrong at the payment platform,
        #        the payment platform was unable to process a message from a downstream partner/acquirer,
        #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
        # @raise [OnlinePayments::SDK::ApiException]if the payment platform returned any other error
        def get_payment_products(query, context = nil)
          uri = instantiate_uri('/v2/{merchantId}/products')
          @communicator.get(
            uri,
            client_headers,
            query,
            OnlinePayments::SDK::Domain::GetPaymentProductsResponse,
            context
          )
        rescue ResponseException => e
          error_type = OnlinePayments::SDK::Domain::ErrorResponse
          error_object = @communicator.marshaller.unmarshal(e.body, error_type)
          raise create_exception(e.status_code, e.body, error_object, context)
        end

        # Resource /v2/!{merchantId}/products/!{paymentProductId}
        # @param payment_product_id [Integer]
        # @param query              [OnlinePayments::SDK::Merchant::Products::GetPaymentProductParams]
        # @param context            [OnlinePayments::SDK::CallContext]
        # @return [OnlinePayments::SDK::Domain::PaymentProduct]
        # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
        # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
        # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
        # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
        #        or there was a conflict (HTTP status code 404, 409 or 410)
        # @raise [OnlinePayments::SDK::PaymentPlatformException] if something went wrong at the payment platform,
        #        the payment platform was unable to process a message from a downstream partner/acquirer,
        #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
        # @raise [OnlinePayments::SDK::ApiException]if the payment platform returned any other error
        def get_payment_product(payment_product_id, query, context = nil)
          path_context = {
            'paymentProductId'.freeze => payment_product_id.to_s,
          }
          uri = instantiate_uri('/v2/{merchantId}/products/{paymentProductId}', path_context)
          @communicator.get(
            uri,
            client_headers,
            query,
            OnlinePayments::SDK::Domain::PaymentProduct,
            context
          )
        rescue ResponseException => e
          error_type = OnlinePayments::SDK::Domain::ErrorResponse
          error_object = @communicator.marshaller.unmarshal(e.body, error_type)
          raise create_exception(e.status_code, e.body, error_object, context)
        end

        # Resource /v2/!{merchantId}/products/!{paymentProductId}/directory
        # @param payment_product_id [Integer]
        # @param query              [OnlinePayments::SDK::Merchant::Products::GetProductDirectoryParams]
        # @param context            [OnlinePayments::SDK::CallContext]
        # @return [OnlinePayments::SDK::Domain::ProductDirectory]
        # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
        # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
        # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
        # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
        #        or there was a conflict (HTTP status code 404, 409 or 410)
        # @raise [OnlinePayments::SDK::PaymentPlatformException] if something went wrong at the payment platform,
        #        the payment platform was unable to process a message from a downstream partner/acquirer,
        #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
        # @raise [OnlinePayments::SDK::ApiException]if the payment platform returned any other error
        def get_product_directory(payment_product_id, query, context = nil)
          path_context = {
            'paymentProductId'.freeze => payment_product_id.to_s,
          }
          uri = instantiate_uri('/v2/{merchantId}/products/{paymentProductId}/directory', path_context)
          @communicator.get(
            uri,
            client_headers,
            query,
            OnlinePayments::SDK::Domain::ProductDirectory,
            context
          )
        rescue ResponseException => e
          error_type = OnlinePayments::SDK::Domain::ErrorResponse
          error_object = @communicator.marshaller.unmarshal(e.body, error_type)
          raise create_exception(e.status_code, e.body, error_object, context)
        end

        # Resource /v2/!{merchantId}/products/!{paymentProductId}/networks
        # @param payment_product_id [Integer]
        # @param query              [OnlinePayments::SDK::Merchant::Products::GetPaymentProductNetworksParams]
        # @param context            [OnlinePayments::SDK::CallContext]
        # @return [OnlinePayments::SDK::Domain::PaymentProductNetworksResponse]
        # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
        # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
        # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
        # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
        #        or there was a conflict (HTTP status code 404, 409 or 410)
        # @raise [OnlinePayments::SDK::PaymentPlatformException] if something went wrong at the payment platform,
        #        the payment platform was unable to process a message from a downstream partner/acquirer,
        #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
        # @raise [OnlinePayments::SDK::ApiException]if the payment platform returned any other error
        def get_payment_product_networks(payment_product_id, query, context = nil)
          path_context = {
            'paymentProductId'.freeze => payment_product_id.to_s,
          }
          uri = instantiate_uri('/v2/{merchantId}/products/{paymentProductId}/networks', path_context)
          @communicator.get(
            uri,
            client_headers,
            query,
            OnlinePayments::SDK::Domain::PaymentProductNetworksResponse,
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
