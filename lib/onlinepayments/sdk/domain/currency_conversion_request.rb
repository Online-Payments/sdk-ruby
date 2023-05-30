#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/card_info'
require 'onlinepayments/sdk/domain/transaction'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::CardInfo] card
    # @attr [OnlinePayments::SDK::Domain::Transaction] transaction
    class CurrencyConversionRequest < OnlinePayments::SDK::DataObject
      attr_accessor :card
      attr_accessor :transaction

      # @return (Hash)
      def to_h
        hash = super
        hash['card'] = @card.to_h if @card
        hash['transaction'] = @transaction.to_h if @transaction
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'card'
          raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
          @card = OnlinePayments::SDK::Domain::CardInfo.new_from_hash(hash['card'])
        end
        if hash.key? 'transaction'
          raise TypeError, "value '%s' is not a Hash" % [hash['transaction']] unless hash['transaction'].is_a? Hash
          @transaction = OnlinePayments::SDK::Domain::Transaction.new_from_hash(hash['transaction'])
        end
      end
    end
  end
end
