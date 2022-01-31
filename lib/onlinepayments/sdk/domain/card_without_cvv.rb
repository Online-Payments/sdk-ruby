#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] card_number
    # @attr [String] cardholder_name
    # @attr [String] expiry_date
    class CardWithoutCvv < OnlinePayments::SDK::DataObject
      attr_accessor :card_number
      attr_accessor :cardholder_name
      attr_accessor :expiry_date

      # @return (Hash)
      def to_h
        hash = super
        hash['cardNumber'] = @card_number unless @card_number.nil?
        hash['cardholderName'] = @cardholder_name unless @cardholder_name.nil?
        hash['expiryDate'] = @expiry_date unless @expiry_date.nil?
        hash
      end

      def from_hash(hash)
        super
        @card_number = hash['cardNumber'] if hash.key? 'cardNumber'
        @cardholder_name = hash['cardholderName'] if hash.key? 'cardholderName'
        @expiry_date = hash['expiryDate'] if hash.key? 'expiryDate'
      end
    end
  end
end
