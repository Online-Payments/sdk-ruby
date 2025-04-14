#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card_without_cvv'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/external_token_linked'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CardWithoutCvv] card
      # @attr [OnlinePayments::SDK::Domain::ExternalTokenLinked] external_token_linked
      # @attr [true/false] is_new_token
      # @attr [String] token
      # @attr [String] token_status
      class CreatedTokenResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card

        attr_accessor :external_token_linked

        attr_accessor :is_new_token

        attr_accessor :token

        attr_accessor :token_status

        # @return (Hash)
        def to_h
          hash = super
          hash['card'] = @card.to_h unless @card.nil?
          hash['externalTokenLinked'] = @external_token_linked.to_h unless @external_token_linked.nil?
          hash['isNewToken'] = @is_new_token unless @is_new_token.nil?
          hash['token'] = @token unless @token.nil?
          hash['tokenStatus'] = @token_status unless @token_status.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'card'
            raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::CardWithoutCvv.new_from_hash(hash['card'])
          end
          if hash.has_key? 'externalTokenLinked'
            raise TypeError, "value '%s' is not a Hash" % [hash['externalTokenLinked']] unless hash['externalTokenLinked'].is_a? Hash
            @external_token_linked = OnlinePayments::SDK::Domain::ExternalTokenLinked.new_from_hash(hash['externalTokenLinked'])
          end
          if hash.has_key? 'isNewToken'
            @is_new_token = hash['isNewToken']
          end
          if hash.has_key? 'token'
            @token = hash['token']
          end
          if hash.has_key? 'tokenStatus'
            @token_status = hash['tokenStatus']
          end
        end
      end
    end
  end
end
