#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] qr_code
    # @attr [String] url_intent
    class PaymentProduct3012 < OnlinePayments::SDK::DataObject
      attr_accessor :qr_code
      attr_accessor :url_intent

      # @return (Hash)
      def to_h
        hash = super
        hash['qrCode'] = @qr_code unless @qr_code.nil?
        hash['urlIntent'] = @url_intent unless @url_intent.nil?
        hash
      end

      def from_hash(hash)
        super
        @qr_code = hash['qrCode'] if hash.key? 'qrCode'
        @url_intent = hash['urlIntent'] if hash.key? 'urlIntent'
      end
    end
  end
end
