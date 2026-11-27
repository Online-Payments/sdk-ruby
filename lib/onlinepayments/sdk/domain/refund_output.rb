# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/operation_payment_references'
require 'onlinepayments/sdk/domain/payment_references'
require 'onlinepayments/sdk/domain/refund_card_method_specific_output'
require 'onlinepayments/sdk/domain/refund_e_wallet_method_specific_output'
require 'onlinepayments/sdk/domain/refund_mobile_method_specific_output'
require 'onlinepayments/sdk/domain/refund_redirect_method_specific_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] amount_of_money
      # @attr [Integer, nil] amount_paid
      # @attr [OnlinePayments::SDK::Domain::RefundCardMethodSpecificOutput, nil] card_refund_method_specific_output
      # @attr [OnlinePayments::SDK::Domain::RefundEWalletMethodSpecificOutput, nil] e_wallet_refund_method_specific_output
      # @attr [String, nil] merchant_parameters
      # @attr [OnlinePayments::SDK::Domain::RefundMobileMethodSpecificOutput, nil] mobile_refund_method_specific_output
      # @attr [OnlinePayments::SDK::Domain::OperationPaymentReferences, nil] operation_references
      # @attr [DateTime, nil] payment_creation_date
      # @attr [String, nil] payment_method
      # @attr [OnlinePayments::SDK::Domain::RefundRedirectMethodSpecificOutput, nil] redirect_refund_method_specific_output
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences, nil] references
      # @attr [DateTime, nil] transaction_date
      class RefundOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :amount_paid

        attr_accessor :card_refund_method_specific_output

        attr_accessor :e_wallet_refund_method_specific_output

        attr_accessor :merchant_parameters

        attr_accessor :mobile_refund_method_specific_output

        attr_accessor :operation_references

        attr_accessor :payment_creation_date

        attr_accessor :payment_method

        attr_accessor :redirect_refund_method_specific_output

        attr_accessor :references

        attr_accessor :transaction_date

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount_of_money: nil,
                       amount_paid: nil,
                       card_refund_method_specific_output: nil,
                       e_wallet_refund_method_specific_output: nil,
                       merchant_parameters: nil,
                       mobile_refund_method_specific_output: nil,
                       operation_references: nil,
                       payment_creation_date: nil,
                       payment_method: nil,
                       redirect_refund_method_specific_output: nil,
                       references: nil,
                       transaction_date: nil)
          super()
          @amount_of_money = amount_of_money
          @amount_paid = amount_paid
          @card_refund_method_specific_output = card_refund_method_specific_output
          @e_wallet_refund_method_specific_output = e_wallet_refund_method_specific_output
          @merchant_parameters = merchant_parameters
          @mobile_refund_method_specific_output = mobile_refund_method_specific_output
          @operation_references = operation_references
          @payment_creation_date = payment_creation_date
          @payment_method = payment_method
          @redirect_refund_method_specific_output = redirect_refund_method_specific_output
          @references = references
          @transaction_date = transaction_date
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
        def with_card_refund_method_specific_output(value)
          @card_refund_method_specific_output = value
          self
        end

        # Sets the property and returns this same instance.
        def with_e_wallet_refund_method_specific_output(value)
          @e_wallet_refund_method_specific_output = value
          self
        end

        # Sets the property and returns this same instance.
        def with_merchant_parameters(value)
          @merchant_parameters = value
          self
        end

        # Sets the property and returns this same instance.
        def with_mobile_refund_method_specific_output(value)
          @mobile_refund_method_specific_output = value
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
        def with_redirect_refund_method_specific_output(value)
          @redirect_refund_method_specific_output = value
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
          hash['amountPaid'] = @amount_paid unless @amount_paid.nil?
          hash['cardRefundMethodSpecificOutput'] = @card_refund_method_specific_output.to_h unless @card_refund_method_specific_output.nil?
          hash['eWalletRefundMethodSpecificOutput'] = @e_wallet_refund_method_specific_output.to_h unless @e_wallet_refund_method_specific_output.nil?
          hash['merchantParameters'] = @merchant_parameters unless @merchant_parameters.nil?
          hash['mobileRefundMethodSpecificOutput'] = @mobile_refund_method_specific_output.to_h unless @mobile_refund_method_specific_output.nil?
          hash['operationReferences'] = @operation_references.to_h unless @operation_references.nil?
          hash['paymentCreationDate'] = @payment_creation_date.iso8601(3) unless @payment_creation_date.nil?
          hash['paymentMethod'] = @payment_method unless @payment_method.nil?
          hash['redirectRefundMethodSpecificOutput'] = @redirect_refund_method_specific_output.to_h unless @redirect_refund_method_specific_output.nil?
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
          if hash.key? 'amountPaid'
            @amount_paid = hash['amountPaid']
          end
          if hash.key? 'cardRefundMethodSpecificOutput'
            raise TypeError, "value '#{hash['cardRefundMethodSpecificOutput']}' is not a Hash" unless hash['cardRefundMethodSpecificOutput'].is_a? Hash
            @card_refund_method_specific_output = OnlinePayments::SDK::Domain::RefundCardMethodSpecificOutput.new_from_hash(hash['cardRefundMethodSpecificOutput'])
          end
          if hash.key? 'eWalletRefundMethodSpecificOutput'
            raise TypeError, "value '#{hash['eWalletRefundMethodSpecificOutput']}' is not a Hash" unless hash['eWalletRefundMethodSpecificOutput'].is_a? Hash
            @e_wallet_refund_method_specific_output = OnlinePayments::SDK::Domain::RefundEWalletMethodSpecificOutput.new_from_hash(hash['eWalletRefundMethodSpecificOutput'])
          end
          if hash.key? 'merchantParameters'
            @merchant_parameters = hash['merchantParameters']
          end
          if hash.key? 'mobileRefundMethodSpecificOutput'
            raise TypeError, "value '#{hash['mobileRefundMethodSpecificOutput']}' is not a Hash" unless hash['mobileRefundMethodSpecificOutput'].is_a? Hash
            @mobile_refund_method_specific_output = OnlinePayments::SDK::Domain::RefundMobileMethodSpecificOutput.new_from_hash(hash['mobileRefundMethodSpecificOutput'])
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
          if hash.key? 'redirectRefundMethodSpecificOutput'
            raise TypeError, "value '#{hash['redirectRefundMethodSpecificOutput']}' is not a Hash" unless hash['redirectRefundMethodSpecificOutput'].is_a? Hash
            @redirect_refund_method_specific_output = OnlinePayments::SDK::Domain::RefundRedirectMethodSpecificOutput.new_from_hash(hash['redirectRefundMethodSpecificOutput'])
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
