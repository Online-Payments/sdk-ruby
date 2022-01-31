#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [true/false] is_allowed_in_context
    # @attr [Integer] payment_product_id
    class IINDetail < OnlinePayments::SDK::DataObject
      attr_accessor :is_allowed_in_context
      attr_accessor :payment_product_id

      # @return (Hash)
      def to_h
        hash = super
        hash['isAllowedInContext'] = @is_allowed_in_context unless @is_allowed_in_context.nil?
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash
      end

      def from_hash(hash)
        super
        @is_allowed_in_context = hash['isAllowedInContext'] if hash.key? 'isAllowedInContext'
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
      end
    end
  end
end
