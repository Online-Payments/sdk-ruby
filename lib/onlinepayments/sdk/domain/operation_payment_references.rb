#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] merchant_comment
      # @attr [String] merchant_reconciliation_reference
      # @attr [String] merchant_reference
      # @attr [String] operation_group_reference
      # @attr [String] soft_descriptor
      # @attr [String] structured_creditor_reference
      class OperationPaymentReferences < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :merchant_comment

        attr_accessor :merchant_reconciliation_reference

        attr_accessor :merchant_reference

        attr_accessor :operation_group_reference

        attr_accessor :soft_descriptor

        attr_accessor :structured_creditor_reference

        # @return (Hash)
        def to_h
          hash = super
          hash['merchantComment'] = @merchant_comment unless @merchant_comment.nil?
          hash['merchantReconciliationReference'] = @merchant_reconciliation_reference unless @merchant_reconciliation_reference.nil?
          hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
          hash['operationGroupReference'] = @operation_group_reference unless @operation_group_reference.nil?
          hash['softDescriptor'] = @soft_descriptor unless @soft_descriptor.nil?
          hash['structuredCreditorReference'] = @structured_creditor_reference unless @structured_creditor_reference.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'merchantComment'
            @merchant_comment = hash['merchantComment']
          end
          if hash.has_key? 'merchantReconciliationReference'
            @merchant_reconciliation_reference = hash['merchantReconciliationReference']
          end
          if hash.has_key? 'merchantReference'
            @merchant_reference = hash['merchantReference']
          end
          if hash.has_key? 'operationGroupReference'
            @operation_group_reference = hash['operationGroupReference']
          end
          if hash.has_key? 'softDescriptor'
            @soft_descriptor = hash['softDescriptor']
          end
          if hash.has_key? 'structuredCreditorReference'
            @structured_creditor_reference = hash['structuredCreditorReference']
          end
        end
      end
    end
  end
end
