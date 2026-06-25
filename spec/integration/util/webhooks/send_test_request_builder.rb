require 'onlinepayments/sdk/domain/send_test_request'

module Integration
  module Util
    module Webhooks
      class SendTestRequestBuilder

        def initialize
          @url = nil
        end

        def with_url(url)
          @url = url
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::SendTestRequest.new
          request.url = @url unless @url.nil?
          request
        end
      end
    end
  end
end
