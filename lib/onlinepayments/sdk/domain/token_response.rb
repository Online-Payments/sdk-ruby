#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/external_token_linked'
require 'onlinepayments/sdk/domain/token_card'
require 'onlinepayments/sdk/domain/token_e_wallet'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::TokenCard] card
    # @attr [OnlinePayments::SDK::Domain::TokenEWallet] e_wallet
    # @attr [OnlinePayments::SDK::Domain::ExternalTokenLinked] external_token_linked
    # @attr [String] id
    # @attr [true/false] is_temporary
    # @attr [Integer] payment_product_id
    class TokenResponse < OnlinePayments::SDK::DataObject
      attr_accessor :card
      attr_accessor :e_wallet
      attr_accessor :external_token_linked
      attr_accessor :id
      attr_accessor :is_temporary
      attr_accessor :payment_product_id

      # @return (Hash)
      def to_h
        hash = super
        hash['card'] = @card.to_h if @card
        hash['eWallet'] = @e_wallet.to_h if @e_wallet
        hash['externalTokenLinked'] = @external_token_linked.to_h if @external_token_linked
        hash['id'] = @id unless @id.nil?
        hash['isTemporary'] = @is_temporary unless @is_temporary.nil?
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'card'
          raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
          @card = OnlinePayments::SDK::Domain::TokenCard.new_from_hash(hash['card'])
        end
        if hash.key? 'eWallet'
          raise TypeError, "value '%s' is not a Hash" % [hash['eWallet']] unless hash['eWallet'].is_a? Hash
          @e_wallet = OnlinePayments::SDK::Domain::TokenEWallet.new_from_hash(hash['eWallet'])
        end
        if hash.key? 'externalTokenLinked'
          raise TypeError, "value '%s' is not a Hash" % [hash['externalTokenLinked']] unless hash['externalTokenLinked'].is_a? Hash
          @external_token_linked = OnlinePayments::SDK::Domain::ExternalTokenLinked.new_from_hash(hash['externalTokenLinked'])
        end
        @id = hash['id'] if hash.key? 'id'
        @is_temporary = hash['isTemporary'] if hash.key? 'isTemporary'
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
      end
    end
  end
end
