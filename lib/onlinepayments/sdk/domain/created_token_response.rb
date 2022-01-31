#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/card_without_cvv'
require 'onlinepayments/sdk/domain/external_token_linked'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::CardWithoutCvv] card
    # @attr [OnlinePayments::SDK::Domain::ExternalTokenLinked] external_token_linked
    # @attr [true/false] is_new_token
    # @attr [String] token
    # @attr [String] token_status
    class CreatedTokenResponse < OnlinePayments::SDK::DataObject
      attr_accessor :card
      attr_accessor :external_token_linked
      attr_accessor :is_new_token
      attr_accessor :token
      attr_accessor :token_status

      # @return (Hash)
      def to_h
        hash = super
        hash['card'] = @card.to_h if @card
        hash['externalTokenLinked'] = @external_token_linked.to_h if @external_token_linked
        hash['isNewToken'] = @is_new_token unless @is_new_token.nil?
        hash['token'] = @token unless @token.nil?
        hash['tokenStatus'] = @token_status unless @token_status.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'card'
          raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
          @card = OnlinePayments::SDK::Domain::CardWithoutCvv.new_from_hash(hash['card'])
        end
        if hash.key? 'externalTokenLinked'
          raise TypeError, "value '%s' is not a Hash" % [hash['externalTokenLinked']] unless hash['externalTokenLinked'].is_a? Hash
          @external_token_linked = OnlinePayments::SDK::Domain::ExternalTokenLinked.new_from_hash(hash['externalTokenLinked'])
        end
        @is_new_token = hash['isNewToken'] if hash.key? 'isNewToken'
        @token = hash['token'] if hash.key? 'token'
        @token_status = hash['tokenStatus'] if hash.key? 'tokenStatus'
      end
    end
  end
end
