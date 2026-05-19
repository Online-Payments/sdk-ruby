#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product5704_auto_capture'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct5704AutoCapture] payment_product5704_auto_capture
      class RedirectPaymentProduct5407SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_product5704_auto_capture

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentProduct5704AutoCapture'] = @payment_product5704_auto_capture.to_h unless @payment_product5704_auto_capture.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentProduct5704AutoCapture'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5704AutoCapture']] unless hash['paymentProduct5704AutoCapture'].is_a? Hash
            @payment_product5704_auto_capture = OnlinePayments::SDK::Domain::PaymentProduct5704AutoCapture.new_from_hash(hash['paymentProduct5704AutoCapture'])
          end
        end
      end
    end
  end
end
