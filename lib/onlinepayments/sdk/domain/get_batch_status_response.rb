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
          if hash.has_key? 'itemCount'
            @item_count = hash['itemCount']
          end
          if hash.has_key? 'merchantBatchReference'
            @merchant_batch_reference = hash['merchantBatchReference']
          end
          if hash.has_key? 'operationType'
            @operation_type = hash['operationType']
          end
          if hash.has_key? 'status'
            @status = hash['status']
          end
        end
      end
    end
  end
end
