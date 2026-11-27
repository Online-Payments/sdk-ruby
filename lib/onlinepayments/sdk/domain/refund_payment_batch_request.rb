# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/refund_request'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] payment_id
      # @attr [OnlinePayments::SDK::Domain::RefundRequest, nil] refund
      class RefundPaymentBatchRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_id

        attr_accessor :refund

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(payment_id: nil, refund: nil)
          super()
          @payment_id = payment_id
          @refund = refund
        end

        # Sets the property and returns this same instance.
        def with_payment_id(value)
          @payment_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_refund(value)
          @refund = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentId'] = @payment_id unless @payment_id.nil?
          hash['refund'] = @refund.to_h unless @refund.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'paymentId'
            @payment_id = hash['paymentId']
          end
          if hash.key? 'refund'
            raise TypeError, "value '#{hash['refund']}' is not a Hash" unless hash['refund'].is_a? Hash
            @refund = OnlinePayments::SDK::Domain::RefundRequest.new_from_hash(hash['refund'])
          end
        end
      end
    end
  end
end
