#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] pairing_token
    # @attr [String] qr_code
    class PaymentProduct5407 < OnlinePayments::SDK::DataObject
      attr_accessor :pairing_token
      attr_accessor :qr_code

      # @return (Hash)
      def to_h
        hash = super
        hash['pairingToken'] = @pairing_token unless @pairing_token.nil?
        hash['qrCode'] = @qr_code unless @qr_code.nil?
        hash
      end

      def from_hash(hash)
        super
        @pairing_token = hash['pairingToken'] if hash.key? 'pairingToken'
        @qr_code = hash['qrCode'] if hash.key? 'qrCode'
      end
    end
  end
end
