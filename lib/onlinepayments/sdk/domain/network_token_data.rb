#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] cardholder_name
      # @attr [String, nil] cryptogram
      # @attr [Integer, nil] eci
      # @attr [String, nil] network_token
      # @attr [String, nil] scheme_token_requestor_id
      # @attr [String, nil] token_expiry_date
      class NetworkTokenData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :cardholder_name

        attr_accessor :cryptogram

        attr_accessor :eci

        attr_accessor :network_token

        attr_accessor :scheme_token_requestor_id

        attr_accessor :token_expiry_date

        # Sets the property and returns this same instance.
        def with_cardholder_name(value)
          @cardholder_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_cryptogram(value)
          @cryptogram = value
          self
        end

        # Sets the property and returns this same instance.
        def with_eci(value)
          @eci = value
          self
        end

        # Sets the property and returns this same instance.
        def with_network_token(value)
          @network_token = value
          self
        end

        # Sets the property and returns this same instance.
        def with_scheme_token_requestor_id(value)
          @scheme_token_requestor_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_token_expiry_date(value)
          @token_expiry_date = value
          self
        end

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
