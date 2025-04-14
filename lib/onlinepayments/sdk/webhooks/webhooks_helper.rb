require 'onlinepayments/sdk/webhooks/webhooks_event'
require 'onlinepayments/sdk/webhooks/api_version_mismatch_exception'
require 'onlinepayments/sdk/webhooks/signature_validator'

module OnlinePayments
  module SDK
    module Webhooks
      # Online Payments platform webhooks Helper, Thread-safe.
      class WebhooksHelper
        def initialize(marshaller, secret_key_store)
          raise ArgumentError if marshaller.nil?
          @marshaller = marshaller
          @signature_validator = OnlinePayments::SDK::Webhooks::SignatureValidator.new(secret_key_store)
        end

        # Unmarshals the given body, while also validating it using the given request headers.
        #
        # @param body            [String] body of the request
        # @param request_headers [Array<OnlinePayments::SDK::Communication::RequestHeader>] headers of the request
        # @return [OnlinePayments::SDK::Webhooks::WebhooksEvent]
        def unmarshal(body, request_headers)
          @signature_validator.validate(body, request_headers)

          event = @marshaller.unmarshal(body, OnlinePayments::SDK::Webhooks::WebhooksEvent)
          validate_api_version(event)
          event
        end

        private

        def validate_api_version(event)
          raise OnlinePayments::SDK::Webhooks::ApiVersionMismatchException.new(event.api_version, 'v1') unless 'v1'.eql?(event.api_version)
        end
      end
    end

  end
end
