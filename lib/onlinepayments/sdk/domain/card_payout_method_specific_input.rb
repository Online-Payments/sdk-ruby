#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::Card] card
      # @attr [Integer] payment_product_id
      # @attr [String] payout_reason
      # @attr [String] token
      class CardPayoutMethodSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card

        attr_accessor :payment_product_id

        attr_accessor :payout_reason

        attr_accessor :token

        # @return (Hash)
        def to_h
          hash = super
          hash['card'] = @card.to_h unless @card.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash['payoutReason'] = @payout_reason unless @payout_reason.nil?
          hash['token'] = @token unless @token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'card'
            raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::Card.new_from_hash(hash['card'])
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
          if hash.has_key? 'payoutReason'
            @payout_reason = hash['payoutReason']
          end
          if hash.has_key? 'token'
            @token = hash['token']
          end
        end
      end
    end
  end
end
