#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/card_source'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
      # @attr [OnlinePayments::SDK::Domain::CardSource] card_source
      class CalculateSurchargeRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :card_source

        # @return (Hash)
        def to_h
          hash = super
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['cardSource'] = @card_source.to_h unless @card_source.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amountOfMoney'
            raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.has_key? 'cardSource'
            raise TypeError, "value '%s' is not a Hash" % [hash['cardSource']] unless hash['cardSource'].is_a? Hash
            @card_source = OnlinePayments::SDK::Domain::CardSource.new_from_hash(hash['cardSource'])
          end
        end
      end
    end
  end
end
