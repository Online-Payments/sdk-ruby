# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/card_source'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] amount_of_money
      # @attr [OnlinePayments::SDK::Domain::CardSource, nil] card_source
      class CalculateSurchargeRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :card_source

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount_of_money: nil, card_source: nil)
          super()
          @amount_of_money = amount_of_money
          @card_source = card_source
        end

        # Sets the property and returns this same instance.
        def with_amount_of_money(value)
          @amount_of_money = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_source(value)
          @card_source = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['cardSource'] = @card_source.to_h unless @card_source.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'amountOfMoney'
            raise TypeError, "value '#{hash['amountOfMoney']}' is not a Hash" unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.key? 'cardSource'
            raise TypeError, "value '#{hash['cardSource']}' is not a Hash" unless hash['cardSource'].is_a? Hash
            @card_source = OnlinePayments::SDK::Domain::CardSource.new_from_hash(hash['cardSource'])
          end
        end
      end
    end
  end
end
