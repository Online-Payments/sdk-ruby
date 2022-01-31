#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] returnmac
    # @attr [String] redirect_url
    class MandateRedirectData < OnlinePayments::SDK::DataObject
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
        @returnmac = hash['RETURNMAC'] if hash.key? 'RETURNMAC'
        @redirect_url = hash['redirectURL'] if hash.key? 'redirectURL'
      end
    end
  end
end
