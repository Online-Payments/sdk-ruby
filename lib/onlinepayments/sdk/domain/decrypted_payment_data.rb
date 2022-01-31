#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] cardholder_name
    # @attr [String] cryptogram
    # @attr [String] dpan
    # @attr [Integer] eci
    # @attr [String] expiry_date
    class DecryptedPaymentData < OnlinePayments::SDK::DataObject
      attr_accessor :cardholder_name
      attr_accessor :cryptogram
      attr_accessor :dpan
      attr_accessor :eci
      attr_accessor :expiry_date

      # @return (Hash)
      def to_h
        hash = super
        hash['cardholderName'] = @cardholder_name unless @cardholder_name.nil?
        hash['cryptogram'] = @cryptogram unless @cryptogram.nil?
        hash['dpan'] = @dpan unless @dpan.nil?
        hash['eci'] = @eci unless @eci.nil?
        hash['expiryDate'] = @expiry_date unless @expiry_date.nil?
        hash
      end

      def from_hash(hash)
        super
        @cardholder_name = hash['cardholderName'] if hash.key? 'cardholderName'
        @cryptogram = hash['cryptogram'] if hash.key? 'cryptogram'
        @dpan = hash['dpan'] if hash.key? 'dpan'
        @eci = hash['eci'] if hash.key? 'eci'
        @expiry_date = hash['expiryDate'] if hash.key? 'expiryDate'
      end
    end
  end
end
