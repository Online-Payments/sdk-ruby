# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/surcharge_for_payment_link'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] amount
      # @attr [String, nil] merchant_reference
      # @attr [OnlinePayments::SDK::Domain::SurchargeForPaymentLink, nil] surcharge_specific_input
      # @deprecated An object containing the details of the related payment input.  All properties in paymentLinkOrder are deprecated. Use corresponding values as noted below: | Property | Replacement | | - | - | | merchantReference | references/merchantReference | | amount | order/amountOfMoney | | surchargeSpecificInput | order/surchargeSpecificInput |
      class PaymentLinkOrderInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount

        attr_accessor :merchant_reference

        attr_accessor :surcharge_specific_input

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount: nil, merchant_reference: nil, surcharge_specific_input: nil)
          super()
          @amount = amount
          @merchant_reference = merchant_reference
          @surcharge_specific_input = surcharge_specific_input
        end

        # Sets the property and returns this same instance.
        def with_amount(value)
          @amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_merchant_reference(value)
          @merchant_reference = value
          self
        end

        # Sets the property and returns this same instance.
        def with_surcharge_specific_input(value)
          @surcharge_specific_input = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['amount'] = @amount.to_h unless @amount.nil?
          hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
          hash['surchargeSpecificInput'] = @surcharge_specific_input.to_h unless @surcharge_specific_input.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'amount'
            raise TypeError, "value '#{hash['amount']}' is not a Hash" unless hash['amount'].is_a? Hash
            @amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amount'])
          end
          if hash.key? 'merchantReference'
            @merchant_reference = hash['merchantReference']
          end
          if hash.key? 'surchargeSpecificInput'
            raise TypeError, "value '#{hash['surchargeSpecificInput']}' is not a Hash" unless hash['surchargeSpecificInput'].is_a? Hash
            @surcharge_specific_input = OnlinePayments::SDK::Domain::SurchargeForPaymentLink.new_from_hash(hash['surchargeSpecificInput'])
          end
        end
      end
    end
  end
end
