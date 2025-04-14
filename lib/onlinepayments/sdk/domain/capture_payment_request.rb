#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/operation_payment_references'
require 'onlinepayments/sdk/domain/payment_references'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer] amount
      # @attr [true/false] is_final
      # @attr [OnlinePayments::SDK::Domain::OperationPaymentReferences] operation_references
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences] references
      class CapturePaymentRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount

        attr_accessor :is_final

        attr_accessor :operation_references

        attr_accessor :references

        # @return (Hash)
        def to_h
          hash = super
          hash['amount'] = @amount unless @amount.nil?
          hash['isFinal'] = @is_final unless @is_final.nil?
          hash['operationReferences'] = @operation_references.to_h unless @operation_references.nil?
          hash['references'] = @references.to_h unless @references.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amount'
            @amount = hash['amount']
          end
          if hash.has_key? 'isFinal'
            @is_final = hash['isFinal']
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
