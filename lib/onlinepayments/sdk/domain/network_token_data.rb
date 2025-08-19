#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] cardholder_name
      # @attr [String] cryptogram
      # @attr [Integer] eci
      # @attr [String] network_token
      # @attr [String] scheme_token_requestor_id
      # @attr [String] token_expiry_date
      class NetworkTokenData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :cardholder_name

        attr_accessor :cryptogram

        attr_accessor :eci

        attr_accessor :network_token

        attr_accessor :scheme_token_requestor_id

        attr_accessor :token_expiry_date

        # @return (Hash)
        def to_h
          hash = super
          hash['cardholderName'] = @cardholder_name unless @cardholder_name.nil?
          hash['cryptogram'] = @cryptogram unless @cryptogram.nil?
          hash['eci'] = @eci unless @eci.nil?
          hash['networkToken'] = @network_token unless @network_token.nil?
          hash['schemeTokenRequestorId'] = @scheme_token_requestor_id unless @scheme_token_requestor_id.nil?
          hash['tokenExpiryDate'] = @token_expiry_date unless @token_expiry_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cardholderName'
            @cardholder_name = hash['cardholderName']
          end
          if hash.has_key? 'cryptogram'
            @cryptogram = hash['cryptogram']
          end
          if hash.has_key? 'eci'
            @eci = hash['eci']
          end
          if hash.has_key? 'networkToken'
            @network_token = hash['networkToken']
          end
          if hash.has_key? 'schemeTokenRequestorId'
            @scheme_token_requestor_id = hash['schemeTokenRequestorId']
          end
          if hash.has_key? 'tokenExpiryDate'
            @token_expiry_date = hash['tokenExpiryDate']
          end
        end
      end
    end
  end
end
