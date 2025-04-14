#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/operation_payment_references'
require 'onlinepayments/sdk/domain/payment_references'
require 'onlinepayments/sdk/domain/payment_status_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
      # @attr [String] id
      # @attr [OnlinePayments::SDK::Domain::OperationPaymentReferences] operation_references
      # @attr [String] payment_method
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences] references
      # @attr [String] status
      # @attr [OnlinePayments::SDK::Domain::PaymentStatusOutput] status_output
      class OperationOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :id

        attr_accessor :operation_references

        attr_accessor :payment_method

        attr_accessor :references

        attr_accessor :status

        attr_accessor :status_output

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
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amountOfMoney'
            raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.has_key? 'id'
            @id = hash['id']
          end
          if hash.has_key? 'operationReferences'
            raise TypeError, "value '%s' is not a Hash" % [hash['operationReferences']] unless hash['operationReferences'].is_a? Hash
            @operation_references = OnlinePayments::SDK::Domain::OperationPaymentReferences.new_from_hash(hash['operationReferences'])
          end
          if hash.has_key? 'paymentMethod'
            @payment_method = hash['paymentMethod']
          end
          if hash.has_key? 'references'
            raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
          end
          if hash.has_key? 'status'
            @status = hash['status']
          end
          if hash.has_key? 'statusOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['statusOutput']] unless hash['statusOutput'].is_a? Hash
            @status_output = OnlinePayments::SDK::Domain::PaymentStatusOutput.new_from_hash(hash['statusOutput'])
          end
        end
      end
    end
  end
end
