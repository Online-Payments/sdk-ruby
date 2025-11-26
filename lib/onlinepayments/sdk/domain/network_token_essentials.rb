#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] bin
      # @attr [String] country_code
      # @attr [String] network_token
      # @attr [String] network_token_state
      # @attr [true/false] network_token_used
      # @attr [String] token_expiry_date
      class NetworkTokenEssentials < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :bin

        attr_accessor :country_code

        attr_accessor :network_token

        attr_accessor :network_token_state

        attr_accessor :network_token_used

        attr_accessor :token_expiry_date

        # @return (Hash)
        def to_h
          hash = super
          hash['bin'] = @bin unless @bin.nil?
          hash['countryCode'] = @country_code unless @country_code.nil?
          hash['networkToken'] = @network_token unless @network_token.nil?
          hash['networkTokenState'] = @network_token_state unless @network_token_state.nil?
          hash['networkTokenUsed'] = @network_token_used unless @network_token_used.nil?
          hash['tokenExpiryDate'] = @token_expiry_date unless @token_expiry_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'bin'
            @bin = hash['bin']
          end
          if hash.has_key? 'countryCode'
            @country_code = hash['countryCode']
          end
          if hash.has_key? 'networkToken'
            @network_token = hash['networkToken']
          end
          if hash.has_key? 'networkTokenState'
            @network_token_state = hash['networkTokenState']
          end
          if hash.has_key? 'networkTokenUsed'
            @network_token_used = hash['networkTokenUsed']
          end
          if hash.has_key? 'tokenExpiryDate'
            @token_expiry_date = hash['tokenExpiryDate']
          end
        end
      end
    end
  end
end
