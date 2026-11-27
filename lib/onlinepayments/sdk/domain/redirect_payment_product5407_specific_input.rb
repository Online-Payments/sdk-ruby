# frozen_string_literal: true

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

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(payment_product5407_auto_capture: nil)
          super()
          @payment_product5407_auto_capture = payment_product5407_auto_capture
        end

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
          if hash.key? 'paymentProduct5407AutoCapture'
            raise TypeError, "value '#{hash['paymentProduct5407AutoCapture']}' is not a Hash" unless hash['paymentProduct5407AutoCapture'].is_a? Hash
            @payment_product5407_auto_capture = OnlinePayments::SDK::Domain::PaymentProduct5407AutoCapture.new_from_hash(hash['paymentProduct5407AutoCapture'])
          end
        end
      end
    end
  end
end
