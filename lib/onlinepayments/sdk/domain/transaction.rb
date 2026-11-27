# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] amount
      class Transaction < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount: nil)
          super()
          @amount = amount
        end

        # Sets the property and returns this same instance.
        def with_amount(value)
          @amount = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['amount'] = @amount.to_h unless @amount.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'amount'
            raise TypeError, "value '#{hash['amount']}' is not a Hash" unless hash['amount'].is_a? Hash
            @amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amount'])
          end
        end
      end
    end
  end
end
