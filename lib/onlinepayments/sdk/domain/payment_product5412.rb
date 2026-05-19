#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] app_url
      # @attr [String] polling_url
      # @attr [String] qr_code
      class PaymentProduct5412 < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :app_url

        attr_accessor :polling_url

        attr_accessor :qr_code

        # @return (Hash)
        def to_h
          hash = super
          hash['appUrl'] = @app_url unless @app_url.nil?
          hash['pollingUrl'] = @polling_url unless @polling_url.nil?
          hash['qrCode'] = @qr_code unless @qr_code.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'appUrl'
            @app_url = hash['appUrl']
          end
          if hash.has_key? 'pollingUrl'
            @polling_url = hash['pollingUrl']
          end
          if hash.has_key? 'qrCode'
            @qr_code = hash['qrCode']
          end
        end
      end
    end
  end
end
