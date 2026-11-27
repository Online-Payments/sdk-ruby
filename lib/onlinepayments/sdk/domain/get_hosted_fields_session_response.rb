# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/token_info'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] session_id
      # @attr [OnlinePayments::SDK::Domain::TokenInfo, nil] token
      class GetHostedFieldsSessionResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :session_id

        attr_accessor :token

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(session_id: nil, token: nil)
          super()
          @session_id = session_id
          @token = token
        end

        # Sets the property and returns this same instance.
        def with_session_id(value)
          @session_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_token(value)
          @token = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['sessionId'] = @session_id unless @session_id.nil?
          hash['token'] = @token.to_h unless @token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'sessionId'
            @session_id = hash['sessionId']
          end
          if hash.key? 'token'
            raise TypeError, "value '#{hash['token']}' is not a Hash" unless hash['token'].is_a? Hash
            @token = OnlinePayments::SDK::Domain::TokenInfo.new_from_hash(hash['token'])
          end
        end
      end
    end
  end
end
