require 'onlinepayments/sdk/domain/get_iin_details_request'

module Integration
  module Util
    module Services
      class GetIINDetailsRequestBuilder
        def initialize
          @bin = '401200'
        end

        def with_bin(bin)
          @bin = bin
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::GetIINDetailsRequest.new
          request.bin = @bin
          request
        end
      end
    end
  end
end