# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/cancel_payment_request'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CancelPaymentRequest, nil] cancel
      # @attr [String, nil] payment_id
      class CancelPaymentBatchRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :cancel

        attr_accessor :payment_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(cancel: nil, payment_id: nil)
          super()
          @cancel = cancel
          @payment_id = payment_id
        end

        # Sets the property and returns this same instance.
        def with_cancel(value)
          @cancel = value
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
          hash['cancel'] = @cancel.to_h unless @cancel.nil?
          hash['paymentId'] = @payment_id unless @payment_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'cancel'
            raise TypeError, "value '#{hash['cancel']}' is not a Hash" unless hash['cancel'].is_a? Hash
            @cancel = OnlinePayments::SDK::Domain::CancelPaymentRequest.new_from_hash(hash['cancel'])
          end
          if hash.key? 'paymentId'
            @payment_id = hash['paymentId']
          end
        end
      end
    end
  end
end
