# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] mode
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] surcharge_amount
      class SurchargeSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :mode

        attr_accessor :surcharge_amount

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(mode: nil, surcharge_amount: nil)
          super()
          @mode = mode
          @surcharge_amount = surcharge_amount
        end

        # Sets the property and returns this same instance.
        def with_mode(value)
          @mode = value
          self
        end

        # Sets the property and returns this same instance.
        def with_surcharge_amount(value)
          @surcharge_amount = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['mode'] = @mode unless @mode.nil?
          hash['surchargeAmount'] = @surcharge_amount.to_h unless @surcharge_amount.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'mode'
            @mode = hash['mode']
          end
          if hash.key? 'surchargeAmount'
            raise TypeError, "value '#{hash['surchargeAmount']}' is not a Hash" unless hash['surchargeAmount'].is_a? Hash
            @surcharge_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['surchargeAmount'])
          end
        end
      end
    end
  end
end
