#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] returnmac
      # @attr [String] redirect_url
      class MandateRedirectData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :returnmac

        attr_accessor :redirect_url

        # @return (Hash)
        def to_h
          hash = super
          hash['RETURNMAC'] = @returnmac unless @returnmac.nil?
          hash['redirectURL'] = @redirect_url unless @redirect_url.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'RETURNMAC'
            @returnmac = hash['RETURNMAC']
          end
          if hash.has_key? 'redirectURL'
            @redirect_url = hash['redirectURL']
          end
        end
      end
    end
  end
end
