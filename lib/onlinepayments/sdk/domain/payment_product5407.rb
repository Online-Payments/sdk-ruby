#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] pairing_token
      # @attr [String] qr_code
      class PaymentProduct5407 < OnlinePayments::SDK::Domain::DataObject

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
          if hash.has_key? 'pairingToken'
            @pairing_token = hash['pairingToken']
          end
          if hash.has_key? 'qrCode'
            @qr_code = hash['qrCode']
          end
        end
      end
    end
  end
end
