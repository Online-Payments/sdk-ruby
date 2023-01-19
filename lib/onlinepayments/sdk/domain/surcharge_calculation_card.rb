#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] card_number
    # @attr [Integer] payment_product_id
    class SurchargeCalculationCard < OnlinePayments::SDK::DataObject
      attr_accessor :card_number
      attr_accessor :payment_product_id

      # @return (Hash)
      def to_h
        hash = super
        hash['cardNumber'] = @card_number unless @card_number.nil?
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash
      end

      def from_hash(hash)
        super
        @card_number = hash['cardNumber'] if hash.key? 'cardNumber'
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
      end
    end
  end
end
