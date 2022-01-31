#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/token_card_specific_input'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::TokenCardSpecificInput] card
    # @attr [Integer] payment_product_id
    class CreateTokenRequest < OnlinePayments::SDK::DataObject
      attr_accessor :card
      attr_accessor :payment_product_id

      # @return (Hash)
      def to_h
        hash = super
        hash['card'] = @card.to_h if @card
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'card'
          raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
          @card = OnlinePayments::SDK::Domain::TokenCardSpecificInput.new_from_hash(hash['card'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
      end
    end
  end
end
