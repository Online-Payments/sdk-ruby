#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] is_cancellable
      # @attr [String] status_category
      # @attr [Integer] status_code
      class PayoutStatusOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :is_cancellable

        attr_accessor :status_category

        attr_accessor :status_code

        # @return (Hash)
        def to_h
          hash = super
          hash['isCancellable'] = @is_cancellable unless @is_cancellable.nil?
          hash['statusCategory'] = @status_category unless @status_category.nil?
          hash['statusCode'] = @status_code unless @status_code.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'isCancellable'
            @is_cancellable = hash['isCancellable']
          end
          if hash.has_key? 'statusCategory'
            @status_category = hash['statusCategory']
          end
          if hash.has_key? 'statusCode'
            @status_code = hash['statusCode']
          end
        end
      end
    end
  end
end
