#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] csr
      class CsrRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :csr

        # @return (Hash)
        def to_h
          hash = super
          hash['csr'] = @csr unless @csr.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'csr'
            @csr = hash['csr']
          end
        end
      end
    end
  end
end
