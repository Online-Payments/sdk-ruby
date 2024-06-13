#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] bin
    # @attr [String] country_code
    # @attr [String] network_token
    # @attr [String] token_expiry_date
    class NetworkTokenEssentials < OnlinePayments::SDK::DataObject
      attr_accessor :bin
      attr_accessor :country_code
      attr_accessor :network_token
      attr_accessor :token_expiry_date

      # @return (Hash)
      def to_h
        hash = super
        hash['bin'] = @bin unless @bin.nil?
        hash['countryCode'] = @country_code unless @country_code.nil?
        hash['networkToken'] = @network_token unless @network_token.nil?
        hash['tokenExpiryDate'] = @token_expiry_date unless @token_expiry_date.nil?
        hash
      end

      def from_hash(hash)
        super
        @bin = hash['bin'] if hash.key? 'bin'
        @country_code = hash['countryCode'] if hash.key? 'countryCode'
        @network_token = hash['networkToken'] if hash.key? 'networkToken'
        @token_expiry_date = hash['tokenExpiryDate'] if hash.key? 'tokenExpiryDate'
      end
    end
  end
end
