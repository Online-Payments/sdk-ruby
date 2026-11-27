# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] pairing_token
      # @attr [String, nil] qr_code
      class PaymentProduct5407 < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :pairing_token

        attr_accessor :qr_code

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(pairing_token: nil, qr_code: nil)
          super()
          @pairing_token = pairing_token
          @qr_code = qr_code
        end

        # Sets the property and returns this same instance.
        def with_pairing_token(value)
          @pairing_token = value
          self
        end

        # Sets the property and returns this same instance.
        def with_qr_code(value)
          @qr_code = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['pairingToken'] = @pairing_token unless @pairing_token.nil?
          hash['qrCode'] = @qr_code unless @qr_code.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'pairingToken'
            @pairing_token = hash['pairingToken']
          end
          if hash.key? 'qrCode'
            @qr_code = hash['qrCode']
          end
        end
      end
    end
  end
end
