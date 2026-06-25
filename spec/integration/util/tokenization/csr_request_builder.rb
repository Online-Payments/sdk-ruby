require 'onlinepayments/sdk/domain/csr_request'

module Integration
  module Util
    module Tokenization
      class CsrRequestBuilder
        VALID_CSR = "-----BEGIN CERTIFICATE REQUEST-----\n" \
          "MIICljCCAX4CAQAwDQYJKoZIhvcNAQEBBQAwDTELMAkGA1UEAwwCQ0EwggEiMA0G\n" \
          "CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCQfbsVzv0L8pKH2l8q6EJf0fzxnDlW\n" \
          "-----END CERTIFICATE REQUEST-----"

        def initialize
          @csr = VALID_CSR
        end

        def with_csr(csr)
          @csr = csr
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::CsrRequest.new
          request.csr = @csr
          request
        end
      end
    end
  end
end
