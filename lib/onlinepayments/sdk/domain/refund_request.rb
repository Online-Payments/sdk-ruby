#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/operation_payment_references'
require 'onlinepayments/sdk/domain/payment_references'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
      # @attr [String] capture_id
      # @attr [OnlinePayments::SDK::Domain::OperationPaymentReferences] operation_references
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences] references
      class RefundRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :capture_id

        attr_accessor :operation_references

        attr_accessor :references

        # @return (Hash)
        def to_h
          hash = super
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['captureId'] = @capture_id unless @capture_id.nil?
          hash['operationReferences'] = @operation_references.to_h unless @operation_references.nil?
          hash['references'] = @references.to_h unless @references.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amountOfMoney'
            raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.has_key? 'captureId'
            @capture_id = hash['captureId']
          end
          if hash.has_key? 'operationReferences'
            raise TypeError, "value '%s' is not a Hash" % [hash['operationReferences']] unless hash['operationReferences'].is_a? Hash
            @operation_references = OnlinePayments::SDK::Domain::OperationPaymentReferences.new_from_hash(hash['operationReferences'])
          end
          if hash.has_key? 'references'
            raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
          end
        end
      end
    end
  end
end
