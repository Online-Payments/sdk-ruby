#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] certificate_id
      # @attr [String] signed_certificate
      class CreateCertificateResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :certificate_id

        attr_accessor :signed_certificate

        # @return (Hash)
        def to_h
          hash = super
          hash['certificateId'] = @certificate_id unless @certificate_id.nil?
          hash['signedCertificate'] = @signed_certificate unless @signed_certificate.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'certificateId'
            @certificate_id = hash['certificateId']
          end
          if hash.has_key? 'signedCertificate'
            @signed_certificate = hash['signedCertificate']
          end
        end
      end
    end
  end
end
