#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/card_without_cvv'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::CardWithoutCvv] card
    class CompletePaymentCardPaymentMethodSpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :card

      # @return (Hash)
      def to_h
        hash = super
        hash['card'] = @card.to_h if @card
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'card'
          raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
          @card = OnlinePayments::SDK::Domain::CardWithoutCvv.new_from_hash(hash['card'])
        end
      end
    end
  end
end
