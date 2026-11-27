# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/operation_payment_references'
require 'onlinepayments/sdk/domain/payment_references'
require 'onlinepayments/sdk/domain/payment_status_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] amount_of_money
      # @attr [String, nil] id
      # @attr [OnlinePayments::SDK::Domain::OperationPaymentReferences, nil] operation_references
      # @attr [String, nil] payment_method
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences, nil] references
      # @attr [String, nil] status
      # @attr [OnlinePayments::SDK::Domain::PaymentStatusOutput, nil] status_output
      # @attr [DateTime, nil] transaction_date
      class OperationOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :id

        attr_accessor :operation_references

        attr_accessor :payment_method

        attr_accessor :references

        attr_accessor :status

        attr_accessor :status_output

        attr_accessor :transaction_date

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount_of_money: nil,
                       id: nil,
                       operation_references: nil,
                       payment_method: nil,
                       references: nil,
                       status: nil,
                       status_output: nil,
                       transaction_date: nil)
          super()
          @amount_of_money = amount_of_money
          @id = id
          @operation_references = operation_references
          @payment_method = payment_method
          @references = references
          @status = status
          @status_output = status_output
          @transaction_date = transaction_date
        end

        # Sets the property and returns this same instance.
        def with_amount_of_money(value)
          @amount_of_money = value
          self
        end

        # Sets the property and returns this same instance.
        def with_id(value)
          @id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_operation_references(value)
          @operation_references = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_method(value)
          @payment_method = value
          self
        end

        # Sets the property and returns this same instance.
        def with_references(value)
          @references = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status(value)
          @status = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status_output(value)
          @status_output = value
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
          hash['id'] = @id unless @id.nil?
          hash['operationReferences'] = @operation_references.to_h unless @operation_references.nil?
          hash['paymentMethod'] = @payment_method unless @payment_method.nil?
          hash['references'] = @references.to_h unless @references.nil?
          hash['status'] = @status unless @status.nil?
          hash['statusOutput'] = @status_output.to_h unless @status_output.nil?
          hash['transactionDate'] = @transaction_date.iso8601(3) unless @transaction_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'amountOfMoney'
            raise TypeError, "value '#{hash['amountOfMoney']}' is not a Hash" unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.key? 'id'
            @id = hash['id']
          end
          if hash.key? 'operationReferences'
            raise TypeError, "value '#{hash['operationReferences']}' is not a Hash" unless hash['operationReferences'].is_a? Hash
            @operation_references = OnlinePayments::SDK::Domain::OperationPaymentReferences.new_from_hash(hash['operationReferences'])
          end
          if hash.key? 'paymentMethod'
            @payment_method = hash['paymentMethod']
          end
          if hash.key? 'references'
            raise TypeError, "value '#{hash['references']}' is not a Hash" unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
          end
          if hash.key? 'status'
            @status = hash['status']
          end
          if hash.key? 'statusOutput'
            raise TypeError, "value '#{hash['statusOutput']}' is not a Hash" unless hash['statusOutput'].is_a? Hash
            @status_output = OnlinePayments::SDK::Domain::PaymentStatusOutput.new_from_hash(hash['statusOutput'])
          end
          if hash.key? 'transactionDate'
            @transaction_date = DateTime.parse(hash['transactionDate'])
          end
        end
      end
    end
  end
end
