# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] amount
      # @attr [String, nil] type
      class AmountBreakdown < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount

        attr_accessor :type

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount: nil, type: nil)
          super()
          @amount = amount
          @type = type
        end

        # Sets the property and returns this same instance.
        def with_amount(value)
          @amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_type(value)
          @type = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['amount'] = @amount unless @amount.nil?
          hash['type'] = @type unless @type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'amount'
            @amount = hash['amount']
          end
          if hash.key? 'type'
            @type = hash['type']
          end
        end
      end
    end
  end
end
