#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] qr_code
      # @attr [String] url_intent
      class PaymentProduct3012 < OnlinePayments::SDK::Domain::DataObject

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
          if hash.has_key? 'qrCode'
            @qr_code = hash['qrCode']
          end
          if hash.has_key? 'urlIntent'
            @url_intent = hash['urlIntent']
          end
        end
      end
    end
  end
end
