# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] merchant_batch_reference
      # @attr [Integer, nil] total_count
      class SubmitBatchResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :merchant_batch_reference

        attr_accessor :total_count

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(merchant_batch_reference: nil, total_count: nil)
          super()
          @merchant_batch_reference = merchant_batch_reference
          @total_count = total_count
        end

        # Sets the property and returns this same instance.
        def with_merchant_batch_reference(value)
          @merchant_batch_reference = value
          self
        end

        # Sets the property and returns this same instance.
        def with_total_count(value)
          @total_count = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['merchantBatchReference'] = @merchant_batch_reference unless @merchant_batch_reference.nil?
          hash['totalCount'] = @total_count unless @total_count.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'merchantBatchReference'
            @merchant_batch_reference = hash['merchantBatchReference']
          end
          if hash.key? 'totalCount'
            @total_count = hash['totalCount']
          end
        end
      end
    end
  end
end
