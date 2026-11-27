# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/card_payment_method_specific_output_summary'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_references'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] amount_of_money
      # @attr [OnlinePayments::SDK::Domain::CardPaymentMethodSpecificOutputSummary, nil] card_payment_method_specific_output
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences, nil] references
      # @attr [DateTime, nil] transaction_date
      class PaymentOutputSummary < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :card_payment_method_specific_output

        attr_accessor :references

        attr_accessor :transaction_date

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount_of_money: nil, card_payment_method_specific_output: nil, references: nil, transaction_date: nil)
          super()
          @amount_of_money = amount_of_money
          @card_payment_method_specific_output = card_payment_method_specific_output
          @references = references
          @transaction_date = transaction_date
        end

        # Sets the property and returns this same instance.
        def with_amount_of_money(value)
          @amount_of_money = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_payment_method_specific_output(value)
          @card_payment_method_specific_output = value
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
          hash['cardPaymentMethodSpecificOutput'] = @card_payment_method_specific_output.to_h unless @card_payment_method_specific_output.nil?
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
          if hash.key? 'cardPaymentMethodSpecificOutput'
            raise TypeError, "value '#{hash['cardPaymentMethodSpecificOutput']}' is not a Hash" unless hash['cardPaymentMethodSpecificOutput'].is_a? Hash
            @card_payment_method_specific_output = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificOutputSummary.new_from_hash(hash['cardPaymentMethodSpecificOutput'])
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
