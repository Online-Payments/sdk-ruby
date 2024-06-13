#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] checkout_response_signature
    # @attr [String] credit_card_brand
    # @attr [String] dpa_id
    class PaymentProduct5002SpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :checkout_response_signature
      attr_accessor :credit_card_brand
      attr_accessor :dpa_id

      # @return (Hash)
      def to_h
        hash = super
        hash['checkoutResponseSignature'] = @checkout_response_signature unless @checkout_response_signature.nil?
        hash['creditCardBrand'] = @credit_card_brand unless @credit_card_brand.nil?
        hash['dpaId'] = @dpa_id unless @dpa_id.nil?
        hash
      end

      def from_hash(hash)
        super
        @checkout_response_signature = hash['checkoutResponseSignature'] if hash.key? 'checkoutResponseSignature'
        @credit_card_brand = hash['creditCardBrand'] if hash.key? 'creditCardBrand'
        @dpa_id = hash['dpaId'] if hash.key? 'dpaId'
      end
    end
  end
end
