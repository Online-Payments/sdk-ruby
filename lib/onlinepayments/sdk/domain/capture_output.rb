# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/card_payment_method_specific_output'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mobile_payment_method_specific_output'
require 'onlinepayments/sdk/domain/operation_payment_references'
require 'onlinepayments/sdk/domain/payment_references'
require 'onlinepayments/sdk/domain/redirect_payment_method_specific_output'
require 'onlinepayments/sdk/domain/sepa_direct_debit_payment_method_specific_output'
require 'onlinepayments/sdk/domain/surcharge_specific_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] acquired_amount
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] amount_of_money
      # @attr [Integer, nil] amount_paid
      # @attr [OnlinePayments::SDK::Domain::CardPaymentMethodSpecificOutput, nil] card_payment_method_specific_output
      # @attr [String, nil] merchant_parameters
      # @attr [OnlinePayments::SDK::Domain::MobilePaymentMethodSpecificOutput, nil] mobile_payment_method_specific_output
      # @attr [OnlinePayments::SDK::Domain::OperationPaymentReferences, nil] operation_references
      # @attr [DateTime, nil] payment_creation_date
      # @attr [String, nil] payment_method
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentMethodSpecificOutput, nil] redirect_payment_method_specific_output
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences, nil] references
      # @attr [OnlinePayments::SDK::Domain::SepaDirectDebitPaymentMethodSpecificOutput, nil] sepa_direct_debit_payment_method_specific_output
      # @attr [OnlinePayments::SDK::Domain::SurchargeSpecificOutput, nil] surcharge_specific_output
      # @attr [DateTime, nil] transaction_date
      class CaptureOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acquired_amount

        attr_accessor :amount_of_money

        # @deprecated Amount that has been paid. This is deprecated. Use acquiredAmount instead.
        attr_accessor :amount_paid

        attr_accessor :card_payment_method_specific_output

        attr_accessor :merchant_parameters

        attr_accessor :mobile_payment_method_specific_output

        attr_accessor :operation_references

        attr_accessor :payment_creation_date

        attr_accessor :payment_method

        attr_accessor :redirect_payment_method_specific_output

        attr_accessor :references

        attr_accessor :sepa_direct_debit_payment_method_specific_output

        attr_accessor :surcharge_specific_output

        attr_accessor :transaction_date

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(acquired_amount: nil,
                       amount_of_money: nil,
                       amount_paid: nil,
                       card_payment_method_specific_output: nil,
                       merchant_parameters: nil,
                       mobile_payment_method_specific_output: nil,
                       operation_references: nil,
                       payment_creation_date: nil,
                       payment_method: nil,
                       redirect_payment_method_specific_output: nil,
                       references: nil,
                       sepa_direct_debit_payment_method_specific_output: nil,
                       surcharge_specific_output: nil,
                       transaction_date: nil)
          super()
          @acquired_amount = acquired_amount
          @amount_of_money = amount_of_money
          @amount_paid = amount_paid
          @card_payment_method_specific_output = card_payment_method_specific_output
          @merchant_parameters = merchant_parameters
          @mobile_payment_method_specific_output = mobile_payment_method_specific_output
          @operation_references = operation_references
          @payment_creation_date = payment_creation_date
          @payment_method = payment_method
          @redirect_payment_method_specific_output = redirect_payment_method_specific_output
          @references = references
          @sepa_direct_debit_payment_method_specific_output = sepa_direct_debit_payment_method_specific_output
          @surcharge_specific_output = surcharge_specific_output
          @transaction_date = transaction_date
        end

        # Sets the property and returns this same instance.
        def with_acquired_amount(value)
          @acquired_amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_amount_of_money(value)
          @amount_of_money = value
          self
        end

        # Sets the property and returns this same instance.
        def with_amount_paid(value)
          @amount_paid = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_payment_method_specific_output(value)
          @card_payment_method_specific_output = value
          self
        end

        # Sets the property and returns this same instance.
        def with_merchant_parameters(value)
          @merchant_parameters = value
          self
        end

        # Sets the property and returns this same instance.
        def with_mobile_payment_method_specific_output(value)
          @mobile_payment_method_specific_output = value
          self
        end

        # Sets the property and returns this same instance.
        def with_operation_references(value)
          @operation_references = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_creation_date(value)
          @payment_creation_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_method(value)
          @payment_method = value
          self
        end

        # Sets the property and returns this same instance.
        def with_redirect_payment_method_specific_output(value)
          @redirect_payment_method_specific_output = value
          self
        end

        # Sets the property and returns this same instance.
        def with_references(value)
          @references = value
          self
        end

        # Sets the property and returns this same instance.
        def with_sepa_direct_debit_payment_method_specific_output(value)
          @sepa_direct_debit_payment_method_specific_output = value
          self
        end

        # Sets the property and returns this same instance.
        def with_surcharge_specific_output(value)
          @surcharge_specific_output = value
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
          hash['acquiredAmount'] = @acquired_amount.to_h unless @acquired_amount.nil?
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['amountPaid'] = @amount_paid unless @amount_paid.nil?
          hash['cardPaymentMethodSpecificOutput'] = @card_payment_method_specific_output.to_h unless @card_payment_method_specific_output.nil?
          hash['merchantParameters'] = @merchant_parameters unless @merchant_parameters.nil?
          hash['mobilePaymentMethodSpecificOutput'] = @mobile_payment_method_specific_output.to_h unless @mobile_payment_method_specific_output.nil?
          hash['operationReferences'] = @operation_references.to_h unless @operation_references.nil?
          hash['paymentCreationDate'] = @payment_creation_date.iso8601(3) unless @payment_creation_date.nil?
          hash['paymentMethod'] = @payment_method unless @payment_method.nil?
          hash['redirectPaymentMethodSpecificOutput'] = @redirect_payment_method_specific_output.to_h unless @redirect_payment_method_specific_output.nil?
          hash['references'] = @references.to_h unless @references.nil?
          hash['sepaDirectDebitPaymentMethodSpecificOutput'] = @sepa_direct_debit_payment_method_specific_output.to_h unless @sepa_direct_debit_payment_method_specific_output.nil?
          hash['surchargeSpecificOutput'] = @surcharge_specific_output.to_h unless @surcharge_specific_output.nil?
          hash['transactionDate'] = @transaction_date.iso8601(3) unless @transaction_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'acquiredAmount'
            raise TypeError, "value '#{hash['acquiredAmount']}' is not a Hash" unless hash['acquiredAmount'].is_a? Hash
            @acquired_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['acquiredAmount'])
          end
          if hash.key? 'amountOfMoney'
            raise TypeError, "value '#{hash['amountOfMoney']}' is not a Hash" unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.key? 'amountPaid'
            @amount_paid = hash['amountPaid']
          end
          if hash.key? 'cardPaymentMethodSpecificOutput'
            raise TypeError, "value '#{hash['cardPaymentMethodSpecificOutput']}' is not a Hash" unless hash['cardPaymentMethodSpecificOutput'].is_a? Hash
            @card_payment_method_specific_output = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificOutput.new_from_hash(hash['cardPaymentMethodSpecificOutput'])
          end
          if hash.key? 'merchantParameters'
            @merchant_parameters = hash['merchantParameters']
          end
          if hash.key? 'mobilePaymentMethodSpecificOutput'
            raise TypeError, "value '#{hash['mobilePaymentMethodSpecificOutput']}' is not a Hash" unless hash['mobilePaymentMethodSpecificOutput'].is_a? Hash
            @mobile_payment_method_specific_output = OnlinePayments::SDK::Domain::MobilePaymentMethodSpecificOutput.new_from_hash(hash['mobilePaymentMethodSpecificOutput'])
          end
          if hash.key? 'operationReferences'
            raise TypeError, "value '#{hash['operationReferences']}' is not a Hash" unless hash['operationReferences'].is_a? Hash
            @operation_references = OnlinePayments::SDK::Domain::OperationPaymentReferences.new_from_hash(hash['operationReferences'])
          end
          if hash.key? 'paymentCreationDate'
            @payment_creation_date = DateTime.parse(hash['paymentCreationDate'])
          end
          if hash.key? 'paymentMethod'
            @payment_method = hash['paymentMethod']
          end
          if hash.key? 'redirectPaymentMethodSpecificOutput'
            raise TypeError, "value '#{hash['redirectPaymentMethodSpecificOutput']}' is not a Hash" unless hash['redirectPaymentMethodSpecificOutput'].is_a? Hash
            @redirect_payment_method_specific_output = OnlinePayments::SDK::Domain::RedirectPaymentMethodSpecificOutput.new_from_hash(hash['redirectPaymentMethodSpecificOutput'])
          end
          if hash.key? 'references'
            raise TypeError, "value '#{hash['references']}' is not a Hash" unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
          end
          if hash.key? 'sepaDirectDebitPaymentMethodSpecificOutput'
            raise TypeError, "value '#{hash['sepaDirectDebitPaymentMethodSpecificOutput']}' is not a Hash" unless hash['sepaDirectDebitPaymentMethodSpecificOutput'].is_a? Hash
            @sepa_direct_debit_payment_method_specific_output = OnlinePayments::SDK::Domain::SepaDirectDebitPaymentMethodSpecificOutput.new_from_hash(hash['sepaDirectDebitPaymentMethodSpecificOutput'])
          end
          if hash.key? 'surchargeSpecificOutput'
            raise TypeError, "value '#{hash['surchargeSpecificOutput']}' is not a Hash" unless hash['surchargeSpecificOutput'].is_a? Hash
            @surcharge_specific_output = OnlinePayments::SDK::Domain::SurchargeSpecificOutput.new_from_hash(hash['surchargeSpecificOutput'])
          end
          if hash.key? 'transactionDate'
            @transaction_date = DateTime.parse(hash['transactionDate'])
          end
        end
      end
    end
  end
end
