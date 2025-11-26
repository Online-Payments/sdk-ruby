#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] expiry_date
      # @attr [String] masked_token
      # @attr [String] token_state
      class NetworkTokenLinked < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :expiry_date

        attr_accessor :masked_token

        attr_accessor :token_state

        # @return (Hash)
        def to_h
          hash = super
          hash['expiryDate'] = @expiry_date unless @expiry_date.nil?
          hash['maskedToken'] = @masked_token unless @masked_token.nil?
          hash['tokenState'] = @token_state unless @token_state.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'expiryDate'
            @expiry_date = hash['expiryDate']
          end
          if hash.has_key? 'maskedToken'
            @masked_token = hash['maskedToken']
          end
          if hash.has_key? 'tokenState'
            @token_state = hash['tokenState']
          end
        end
      end
    end
  end
end
