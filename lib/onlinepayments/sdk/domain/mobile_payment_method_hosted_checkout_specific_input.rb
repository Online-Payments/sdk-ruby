#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] authorization_mode
    # @attr [Integer] payment_product_id
    class MobilePaymentMethodHostedCheckoutSpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :authorization_mode
      attr_accessor :payment_product_id

      # @return (Hash)
      def to_h
        hash = super
        hash['authorizationMode'] = @authorization_mode unless @authorization_mode.nil?
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash
      end

      def from_hash(hash)
        super
        @authorization_mode = hash['authorizationMode'] if hash.key? 'authorizationMode'
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
      end
    end
  end
end
