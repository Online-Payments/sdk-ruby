#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/token_info'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] session_id
      # @attr [OnlinePayments::SDK::Domain::TokenInfo] token
      class GetHostedFieldsSessionResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :session_id

        attr_accessor :token

        # @return (Hash)
        def to_h
          hash = super
          hash['sessionId'] = @session_id unless @session_id.nil?
          hash['token'] = @token.to_h unless @token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'sessionId'
            @session_id = hash['sessionId']
          end
          if hash.has_key? 'token'
            raise TypeError, "value '%s' is not a Hash" % [hash['token']] unless hash['token'].is_a? Hash
            @token = OnlinePayments::SDK::Domain::TokenInfo.new_from_hash(hash['token'])
          end
        end
      end
    end
  end
end
