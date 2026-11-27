# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_references'
require 'onlinepayments/sdk/domain/payout_card_payment_method_specific_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] amount_of_money
      # @attr [DateTime, nil] payment_creation_date
      # @attr [OnlinePayments::SDK::Domain::PayoutCardPaymentMethodSpecificOutput, nil] payout_card_payment_method_specific_output
      # @attr [String, nil] payout_reason
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences, nil] references
      # @attr [DateTime, nil] transaction_date
      class PayoutOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :payment_creation_date

        attr_accessor :payout_card_payment_method_specific_output

        attr_accessor :payout_reason

        attr_accessor :references

        attr_accessor :transaction_date

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount_of_money: nil,
                       payment_creation_date: nil,
                       payout_card_payment_method_specific_output: nil,
                       payout_reason: nil,
                       references: nil,
                       transaction_date: nil)
          super()
          @amount_of_money = amount_of_money
          @payment_creation_date = payment_creation_date
          @payout_card_payment_method_specific_output = payout_card_payment_method_specific_output
          @payout_reason = payout_reason
          @references = references
          @transaction_date = transaction_date
        end

        # Sets the property and returns this same instance.
        def with_amount_of_money(value)
          @amount_of_money = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_creation_date(value)
          @payment_creation_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payout_card_payment_method_specific_output(value)
          @payout_card_payment_method_specific_output = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payout_reason(value)
          @payout_reason = value
          self
        end

        # Sets the property and returns this same instance.
        def with_references(value)
          @references = value
          self
        end

        # Sets the property and returns this same instance.
        def with_transaction_date(value)
          @transaction_date = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['paymentCreationDate'] = @payment_creation_date.iso8601(3) unless @payment_creation_date.nil?
          hash['payoutCardPaymentMethodSpecificOutput'] = @payout_card_payment_method_specific_output.to_h unless @payout_card_payment_method_specific_output.nil?
          hash['payoutReason'] = @payout_reason unless @payout_reason.nil?
          hash['references'] = @references.to_h unless @references.nil?
          hash['transactionDate'] = @transaction_date.iso8601(3) unless @transaction_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'amountOfMoney'
            raise TypeError, "value '#{hash['amountOfMoney']}' is not a Hash" unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.key? 'paymentCreationDate'
            @payment_creation_date = DateTime.parse(hash['paymentCreationDate'])
          end
          if hash.key? 'payoutCardPaymentMethodSpecificOutput'
            raise TypeError, "value '#{hash['payoutCardPaymentMethodSpecificOutput']}' is not a Hash" unless hash['payoutCardPaymentMethodSpecificOutput'].is_a? Hash
            @payout_card_payment_method_specific_output = OnlinePayments::SDK::Domain::PayoutCardPaymentMethodSpecificOutput.new_from_hash(hash['payoutCardPaymentMethodSpecificOutput'])
          end
          if hash.key? 'payoutReason'
            @payout_reason = hash['payoutReason']
          end
          if hash.key? 'references'
            raise TypeError, "value '#{hash['references']}' is not a Hash" unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
          end
          if hash.key? 'transactionDate'
            @transaction_date = DateTime.parse(hash['transactionDate'])
          end
        end
      end
    end
  end
end
