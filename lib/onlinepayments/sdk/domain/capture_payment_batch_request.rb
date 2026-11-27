# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/capture_payment_request'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CapturePaymentRequest, nil] capture
      # @attr [String, nil] payment_id
      class CapturePaymentBatchRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :capture

        attr_accessor :payment_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(capture: nil, payment_id: nil)
          super()
          @capture = capture
          @payment_id = payment_id
        end

        # Sets the property and returns this same instance.
        def with_capture(value)
          @capture = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_id(value)
          @payment_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['capture'] = @capture.to_h unless @capture.nil?
          hash['paymentId'] = @payment_id unless @payment_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'capture'
            raise TypeError, "value '#{hash['capture']}' is not a Hash" unless hash['capture'].is_a? Hash
            @capture = OnlinePayments::SDK::Domain::CapturePaymentRequest.new_from_hash(hash['capture'])
          end
          if hash.key? 'paymentId'
            @payment_id = hash['paymentId']
          end
        end
      end
    end
  end
end
