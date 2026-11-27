# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] amount
      # @attr [String, nil] currency_code
      class AmountOfMoney < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount

        attr_accessor :currency_code

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount: nil, currency_code: nil)
          super()
          @amount = amount
          @currency_code = currency_code
        end

        # Sets the property and returns this same instance.
        def with_amount(value)
          @amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_currency_code(value)
          @currency_code = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['amount'] = @amount unless @amount.nil?
          hash['currencyCode'] = @currency_code unless @currency_code.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'amount'
            @amount = hash['amount']
          end
          if hash.key? 'currencyCode'
            @currency_code = hash['currencyCode']
          end
        end
      end
    end
  end
end
