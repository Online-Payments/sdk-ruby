# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] item_count
      # @attr [String, nil] merchant_batch_reference
      # @attr [String, nil] operation_type
      # @attr [String, nil] status
      class GetBatchStatusResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :item_count

        attr_accessor :merchant_batch_reference

        attr_accessor :operation_type

        attr_accessor :status

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(item_count: nil, merchant_batch_reference: nil, operation_type: nil, status: nil)
          super()
          @item_count = item_count
          @merchant_batch_reference = merchant_batch_reference
          @operation_type = operation_type
          @status = status
        end

        # Sets the property and returns this same instance.
        def with_item_count(value)
          @item_count = value
          self
        end

        # Sets the property and returns this same instance.
        def with_merchant_batch_reference(value)
          @merchant_batch_reference = value
          self
        end

        # Sets the property and returns this same instance.
        def with_operation_type(value)
          @operation_type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status(value)
          @status = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['itemCount'] = @item_count unless @item_count.nil?
          hash['merchantBatchReference'] = @merchant_batch_reference unless @merchant_batch_reference.nil?
          hash['operationType'] = @operation_type unless @operation_type.nil?
          hash['status'] = @status unless @status.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'itemCount'
            @item_count = hash['itemCount']
          end
          if hash.key? 'merchantBatchReference'
            @merchant_batch_reference = hash['merchantBatchReference']
          end
          if hash.key? 'operationType'
            @operation_type = hash['operationType']
          end
          if hash.key? 'status'
            @status = hash['status']
          end
        end
      end
    end
  end
end
