#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/card_source'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
    # @attr [OnlinePayments::SDK::Domain::CardSource] card_source
    class CalculateSurchargeRequest < OnlinePayments::SDK::DataObject
      attr_accessor :amount_of_money
      attr_accessor :card_source

      # @return (Hash)
      def to_h
        hash = super
        hash['amountOfMoney'] = @amount_of_money.to_h if @amount_of_money
        hash['cardSource'] = @card_source.to_h if @card_source
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'amountOfMoney'
          raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
          @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        if hash.key? 'cardSource'
          raise TypeError, "value '%s' is not a Hash" % [hash['cardSource']] unless hash['cardSource'].is_a? Hash
          @card_source = OnlinePayments::SDK::Domain::CardSource.new_from_hash(hash['cardSource'])
        end
      end
    end
  end
end
