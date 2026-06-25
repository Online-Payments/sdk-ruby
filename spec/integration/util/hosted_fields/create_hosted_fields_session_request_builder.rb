require 'onlinepayments/sdk/domain/create_hosted_fields_session_request'

module Integration
  module Util
    module HostedFields
      class CreateHostedFieldsSessionRequestBuilder
        def initialize
          @locale = 'en_US'
          @tokens = nil
        end

        def with_locale(locale)
          @locale = locale
          self
        end

        def with_tokens(tokens)
          @tokens = tokens
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::CreateHostedFieldsSessionRequest.new
          request.locale = @locale
          request.tokens = @tokens unless @tokens.nil?
          request
        end
      end
    end
  end
end