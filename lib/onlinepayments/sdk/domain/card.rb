#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] card_number
    # @attr [String] cardholder_name
    # @attr [String] cvv
    # @attr [String] expiry_date
    class Card < OnlinePayments::SDK::DataObject
      attr_accessor :card_number
      attr_accessor :cardholder_name
      attr_accessor :cvv
      attr_accessor :expiry_date

      # @return (Hash)
      def to_h
        hash = super
        hash['cardNumber'] = @card_number unless @card_number.nil?
        hash['cardholderName'] = @cardholder_name unless @cardholder_name.nil?
        hash['cvv'] = @cvv unless @cvv.nil?
        hash['expiryDate'] = @expiry_date unless @expiry_date.nil?
        hash
      end

      def from_hash(hash)
        super
        @card_number = hash['cardNumber'] if hash.key? 'cardNumber'
        @cardholder_name = hash['cardholderName'] if hash.key? 'cardholderName'
        @cvv = hash['cvv'] if hash.key? 'cvv'
        @expiry_date = hash['expiryDate'] if hash.key? 'expiryDate'
      end
    end
  end
end
