#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] revocation_reason
      class RevokeMandateRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :revocation_reason

        # @return (Hash)
        def to_h
          hash = super
          hash['revocationReason'] = @revocation_reason unless @revocation_reason.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'revocationReason'
            @revocation_reason = hash['revocationReason']
          end
        end
      end
    end
  end
end
