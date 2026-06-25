require 'onlinepayments/sdk/domain/revoke_mandate_request'

module Integration
  module Util
    module Mandates
      class RevokeMandateRequestBuilder
        def initialize
          @revocation_reason = 'userAction'
        end

        def with_revocation_reason(value)
          @revocation_reason = value
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::RevokeMandateRequest.new
          request.revocation_reason = @revocation_reason
          request
        end
      end
    end
  end
end
