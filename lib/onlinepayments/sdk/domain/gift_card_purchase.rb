# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] amount_of_money
      # @attr [Integer, nil] number_of_gift_cards
      class GiftCardPurchase < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :number_of_gift_cards

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount_of_money: nil, number_of_gift_cards: nil)
          super()
          @amount_of_money = amount_of_money
          @number_of_gift_cards = number_of_gift_cards
        end

        # Sets the property and returns this same instance.
        def with_amount_of_money(value)
          @amount_of_money = value
          self
        end

        # Sets the property and returns this same instance.
        def with_number_of_gift_cards(value)
          @number_of_gift_cards = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['numberOfGiftCards'] = @number_of_gift_cards unless @number_of_gift_cards.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'amountOfMoney'
            raise TypeError, "value '#{hash['amountOfMoney']}' is not a Hash" unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.key? 'numberOfGiftCards'
            @number_of_gift_cards = hash['numberOfGiftCards']
          end
        end
      end
    end
  end
end
