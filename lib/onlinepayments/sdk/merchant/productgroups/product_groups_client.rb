#
# This file was automatically generated.
#
require 'onlinepayments/sdk/api_resource'
require 'onlinepayments/sdk/exception_factory'
require 'onlinepayments/sdk/communication/response_exception'
require 'onlinepayments/sdk/domain/error_response'
require 'onlinepayments/sdk/domain/get_payment_product_groups_response'
require 'onlinepayments/sdk/domain/payment_product_group'

module OnlinePayments
  module SDK
    module Merchant
      module ProductGroups
        # ProductGroups client. Thread-safe.
        class ProductGroupsClient < OnlinePayments::SDK::ApiResource

          # @param parent       [OnlinePayments::SDK::ApiResource]
          # @param path_context [Hash, nil]
          def initialize(parent, path_context)
            super(parent: parent, path_context: path_context)
          end

          # Resource /v2/!{merchantId}/productgroups - Get product groups
          #
          # @param query   [OnlinePayments::SDK::Merchant::ProductGroups::GetProductGroupsParams]
          # @param context [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::GetPaymentProductGroupsResponse]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def get_product_groups(query, context = nil)
            uri = instantiate_uri('/v2/{merchantId}/productgroups', nil)
            @communicator.get(
              uri,
              client_headers,
              query,
              OnlinePayments::SDK::Domain::GetPaymentProductGroupsResponse,
              context)
          rescue OnlinePayments::SDK::Communication::ResponseException => e
            error_type = OnlinePayments::SDK::Domain::ErrorResponse
            error_object = @communicator.marshaller.unmarshal(e.body, error_type)
            raise OnlinePayments::SDK.create_exception(e.status_code, e.body, error_object, context)
          end

          # Resource /v2/!{merchantId}/productgroups/!{paymentProductGroupId} - Get product group
          #
          # @param payment_product_group_id [String]
          # @param query                    [OnlinePayments::SDK::Merchant::ProductGroups::GetProductGroupParams]
          # @param context                  [OnlinePayments::SDK::CallContext, nil]
          # @return [OnlinePayments::SDK::Domain::PaymentProductGroup]
          # @raise [OnlinePayments::SDK::IdempotenceException] if an idempotent request caused a conflict (HTTP status code 409)
          # @raise [OnlinePayments::SDK::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
          # @raise [OnlinePayments::SDK::AuthorizationException] if the request was not allowed (HTTP status code 403)
          # @raise [OnlinePayments::SDK::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
          #        or there was a conflict (HTTP status code 404, 409 or 410)
          # @raise [OnlinePayments::SDK::PlatformException] if something went wrong at the payment platform,
          #        the payment platform was unable to process a message from a downstream partner/acquirer,
          #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
          # @raise [OnlinePayments::SDK::ApiException] if the payment platform returned any other error
          def get_product_group(payment_product_group_id, query, context = nil)
            path_context = {
              'paymentProductGroupId'.freeze => payment_product_group_id,
            }
            uri = instantiate_uri('/v2/{merchantId}/productgroups/{paymentProductGroupId}', path_context)
            @communicator.get(
              uri,
              client_headers,
              query,
              OnlinePayments::SDK::Domain::PaymentProductGroup,
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
