#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/capture_payment_request'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CapturePaymentRequest] capture
      # @attr [String] payment_id
      class CapturePaymentBatchRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :capture

        attr_accessor :payment_id

        # @return (Hash)
        def to_h
          hash = super
          hash['capture'] = @capture.to_h unless @capture.nil?
          hash['paymentId'] = @payment_id unless @payment_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'capture'
            raise TypeError, "value '%s' is not a Hash" % [hash['capture']] unless hash['capture'].is_a? Hash
            @capture = OnlinePayments::SDK::Domain::CapturePaymentRequest.new_from_hash(hash['capture'])
          end
          if hash.has_key? 'paymentId'
            @payment_id = hash['paymentId']
          end
        end
      end
    end
  end
end
