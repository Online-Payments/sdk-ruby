#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] merchant_batch_reference
      # @attr [Integer] total_count
      class SubmitBatchResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :merchant_batch_reference

        attr_accessor :total_count

        # @return (Hash)
        def to_h
          hash = super
          hash['merchantBatchReference'] = @merchant_batch_reference unless @merchant_batch_reference.nil?
          hash['totalCount'] = @total_count unless @total_count.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'merchantBatchReference'
            @merchant_batch_reference = hash['merchantBatchReference']
          end
          if hash.has_key? 'totalCount'
            @total_count = hash['totalCount']
          end
        end
      end
    end
  end
end
