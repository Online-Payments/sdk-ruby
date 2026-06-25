require 'onlinepayments/sdk/domain/create_hosted_tokenization_request'

module Integration
  module Util
    module HostedTokenization
      class CreateHostedTokenizationRequestBuilder
        def initialize
          @ask_consumer_consent = true
          @locale = 'en_US'
          @tokens = []
        end

        def with_ask_consumer_consent(ask_consumer_consent)
          @ask_consumer_consent = ask_consumer_consent
          self
        end

        def with_locale(locale)
          @locale = locale
          self
        end

        def with_token(token)
          @tokens << token
          self
        end

        def with_tokens(*tokens)
          @tokens = tokens.flatten
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::CreateHostedTokenizationRequest.new
          request.ask_consumer_consent = @ask_consumer_consent
          request.locale = @locale
          request.tokens = @tokens.empty? ? nil : @tokens.join(',')
          request
        end
      end
    end
  end
end
