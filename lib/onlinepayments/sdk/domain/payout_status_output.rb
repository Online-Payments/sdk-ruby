#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [true/false] is_cancellable
    # @attr [String] status_category
    # @attr [Integer] status_code
    class PayoutStatusOutput < OnlinePayments::SDK::DataObject
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
        @is_cancellable = hash['isCancellable'] if hash.key? 'isCancellable'
        @status_category = hash['statusCategory'] if hash.key? 'statusCategory'
        @status_code = hash['statusCode'] if hash.key? 'statusCode'
      end
    end
  end
end
