# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] expiry_date
      # @attr [String, nil] masked_token
      # @attr [String, nil] token_state
      class NetworkTokenLinked < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :expiry_date

        attr_accessor :masked_token

        attr_accessor :token_state

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(expiry_date: nil, masked_token: nil, token_state: nil)
          super()
          @expiry_date = expiry_date
          @masked_token = masked_token
          @token_state = token_state
        end

        # Sets the property and returns this same instance.
        def with_expiry_date(value)
          @expiry_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_masked_token(value)
          @masked_token = value
          self
        end

        # Sets the property and returns this same instance.
        def with_token_state(value)
          @token_state = value
          self
        end

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
          if hash.key? 'expiryDate'
            @expiry_date = hash['expiryDate']
          end
          if hash.key? 'maskedToken'
            @masked_token = hash['maskedToken']
          end
          if hash.key? 'tokenState'
            @token_state = hash['tokenState']
          end
        end
      end
    end
  end
end
