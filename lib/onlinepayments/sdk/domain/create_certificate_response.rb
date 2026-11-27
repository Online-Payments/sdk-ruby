# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] certificate_id
      # @attr [String, nil] signed_certificate
      class CreateCertificateResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :certificate_id

        attr_accessor :signed_certificate

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(certificate_id: nil, signed_certificate: nil)
          super()
          @certificate_id = certificate_id
          @signed_certificate = signed_certificate
        end

        # Sets the property and returns this same instance.
        def with_certificate_id(value)
          @certificate_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_signed_certificate(value)
          @signed_certificate = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['certificateId'] = @certificate_id unless @certificate_id.nil?
          hash['signedCertificate'] = @signed_certificate unless @signed_certificate.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'certificateId'
            @certificate_id = hash['certificateId']
          end
          if hash.key? 'signedCertificate'
            @signed_certificate = hash['signedCertificate']
          end
        end
      end
    end
  end
end
