require 'onlinepayments/sdk/domain/session_request'

module Integration
  module Util
    module Sessions
      class SessionRequestBuilder
        def initialize
          @tokens = []
        end

        def with_token(token)
          @tokens << token
          self
        end

        def with_tokens(*tokens)
          @tokens = tokens
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::SessionRequest.new
          request.tokens = @tokens.empty? ? nil : @tokens
          request
        end
      end
    end
  end
end