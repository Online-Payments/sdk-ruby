#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] app_switch_link
    # @attr [String] qr_code_url
    class PaymentProduct5404 < OnlinePayments::SDK::DataObject
      attr_accessor :app_switch_link
      attr_accessor :qr_code_url

      # @return (Hash)
      def to_h
        hash = super
        hash['appSwitchLink'] = @app_switch_link unless @app_switch_link.nil?
        hash['qrCodeUrl'] = @qr_code_url unless @qr_code_url.nil?
        hash
      end

      def from_hash(hash)
        super
        @app_switch_link = hash['appSwitchLink'] if hash.key? 'appSwitchLink'
        @qr_code_url = hash['qrCodeUrl'] if hash.key? 'qrCodeUrl'
      end
    end
  end
end
