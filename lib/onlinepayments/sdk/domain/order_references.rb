#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] descriptor
      # @attr [String] merchant_parameters
      # @attr [String] merchant_reference
      # @attr [String] operation_group_reference
      class OrderReferences < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :descriptor

        attr_accessor :merchant_parameters

        attr_accessor :merchant_reference

        attr_accessor :operation_group_reference

        # @return (Hash)
        def to_h
          hash = super
          hash['descriptor'] = @descriptor unless @descriptor.nil?
          hash['merchantParameters'] = @merchant_parameters unless @merchant_parameters.nil?
          hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
          hash['operationGroupReference'] = @operation_group_reference unless @operation_group_reference.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'descriptor'
            @descriptor = hash['descriptor']
          end
          if hash.has_key? 'merchantParameters'
            @merchant_parameters = hash['merchantParameters']
          end
          if hash.has_key? 'merchantReference'
            @merchant_reference = hash['merchantReference']
          end
          if hash.has_key? 'operationGroupReference'
            @operation_group_reference = hash['operationGroupReference']
          end
        end
      end
    end
  end
end
