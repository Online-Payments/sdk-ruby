#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product5407_auto_capture'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct5407AutoCapture, nil] payment_product5407_auto_capture
      class RedirectPaymentProduct5407SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_product5407_auto_capture

        # Sets the property and returns this same instance.
        def with_payment_product5407_auto_capture(value)
          @payment_product5407_auto_capture = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentProduct5407AutoCapture'] = @payment_product5407_auto_capture.to_h unless @payment_product5407_auto_capture.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentProduct5407AutoCapture'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5407AutoCapture']] unless hash['paymentProduct5407AutoCapture'].is_a? Hash
            @payment_product5407_auto_capture = OnlinePayments::SDK::Domain::PaymentProduct5407AutoCapture.new_from_hash(hash['paymentProduct5407AutoCapture'])
          end
        end
      end
    end
  end
end
