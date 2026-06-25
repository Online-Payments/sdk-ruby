require 'onlinepayments/sdk/domain/validate_credentials_request'

module Integration
  module Util
    module Webhooks
      class ValidateCredentialsRequestBuilder

        def initialize
          @key = nil
          @secret = nil
        end

        def with_key(key)
          @key = key
          self
        end

        def with_secret(secret)
          @secret = secret
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::ValidateCredentialsRequest.new
          request.key = @key unless @key.nil?
          request.secret = @secret unless @secret.nil?
          request
        end
      end
    end
  end
end
