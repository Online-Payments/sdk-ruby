# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/token_response'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::TokenResponse, nil] token
      # @attr [String, nil] token_status
      class GetHostedTokenizationResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :token

        attr_accessor :token_status

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(token: nil, token_status: nil)
          super()
          @token = token
          @token_status = token_status
        end

        # Sets the property and returns this same instance.
        def with_token(value)
          @token = value
          self
        end

        # Sets the property and returns this same instance.
        def with_token_status(value)
          @token_status = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['token'] = @token.to_h unless @token.nil?
          hash['tokenStatus'] = @token_status unless @token_status.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'token'
            raise TypeError, "value '#{hash['token']}' is not a Hash" unless hash['token'].is_a? Hash
            @token = OnlinePayments::SDK::Domain::TokenResponse.new_from_hash(hash['token'])
          end
          if hash.key? 'tokenStatus'
            @token_status = hash['tokenStatus']
          end
        end
      end
    end
  end
end
