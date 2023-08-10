#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/dcc_card_source'
require 'onlinepayments/sdk/domain/transaction'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::DccCardSource] card_source
    # @attr [OnlinePayments::SDK::Domain::Transaction] transaction
    class CurrencyConversionRequest < OnlinePayments::SDK::DataObject
      attr_accessor :card_source
      attr_accessor :transaction

      # @return (Hash)
      def to_h
        hash = super
        hash['cardSource'] = @card_source.to_h if @card_source
        hash['transaction'] = @transaction.to_h if @transaction
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'cardSource'
          raise TypeError, "value '%s' is not a Hash" % [hash['cardSource']] unless hash['cardSource'].is_a? Hash
          @card_source = OnlinePayments::SDK::Domain::DccCardSource.new_from_hash(hash['cardSource'])
        end
        if hash.key? 'transaction'
          raise TypeError, "value '%s' is not a Hash" % [hash['transaction']] unless hash['transaction'].is_a? Hash
          @transaction = OnlinePayments::SDK::Domain::Transaction.new_from_hash(hash['transaction'])
        end
      end
    end
  end
end
