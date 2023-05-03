#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/card'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::Card] card
    # @attr [Integer] payment_product_id
    # @attr [String] payout_reason
    # @attr [String] token
    class CardPayoutMethodSpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :card
      attr_accessor :payment_product_id
      attr_accessor :payout_reason
      attr_accessor :token

      # @return (Hash)
      def to_h
        hash = super
        hash['card'] = @card.to_h if @card
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['payoutReason'] = @payout_reason unless @payout_reason.nil?
        hash['token'] = @token unless @token.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'card'
          raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
          @card = OnlinePayments::SDK::Domain::Card.new_from_hash(hash['card'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        @payout_reason = hash['payoutReason'] if hash.key? 'payoutReason'
        @token = hash['token'] if hash.key? 'token'
      end
    end
  end
end
