#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] bin
    # @attr [String] card_number
    # @attr [String] expiry_date
    class CardEssentials < OnlinePayments::SDK::DataObject
      attr_accessor :bin
      attr_accessor :card_number
      attr_accessor :expiry_date

      # @return (Hash)
      def to_h
        hash = super
        hash['bin'] = @bin unless @bin.nil?
        hash['cardNumber'] = @card_number unless @card_number.nil?
        hash['expiryDate'] = @expiry_date unless @expiry_date.nil?
        hash
      end

      def from_hash(hash)
        super
        @bin = hash['bin'] if hash.key? 'bin'
        @card_number = hash['cardNumber'] if hash.key? 'cardNumber'
        @expiry_date = hash['expiryDate'] if hash.key? 'expiryDate'
      end
    end
  end
end
