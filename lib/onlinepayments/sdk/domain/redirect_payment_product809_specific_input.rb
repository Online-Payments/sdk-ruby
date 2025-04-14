#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] issuer_id
      class RedirectPaymentProduct809SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :issuer_id

        # @return (Hash)
        def to_h
          hash = super
          hash['issuerId'] = @issuer_id unless @issuer_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'issuerId'
            @issuer_id = hash['issuerId']
          end
        end
      end
    end
  end
end
