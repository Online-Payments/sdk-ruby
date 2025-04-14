#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] app_switch_link
      # @attr [String] qr_code_url
      class PaymentProduct5404 < OnlinePayments::SDK::Domain::DataObject

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
          if hash.has_key? 'appSwitchLink'
            @app_switch_link = hash['appSwitchLink']
          end
          if hash.has_key? 'qrCodeUrl'
            @qr_code_url = hash['qrCodeUrl']
          end
        end
      end
    end
  end
end
