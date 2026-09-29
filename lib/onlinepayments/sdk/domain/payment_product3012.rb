#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] qr_code
      # @attr [String, nil] url_intent
      class PaymentProduct3012 < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :qr_code

        attr_accessor :url_intent

        # Sets the property and returns this same instance.
        def with_qr_code(value)
          @qr_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_url_intent(value)
          @url_intent = value
          self
        end

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
