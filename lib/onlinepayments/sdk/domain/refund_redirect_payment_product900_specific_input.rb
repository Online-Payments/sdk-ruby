# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] refund_reason
      class RefundRedirectPaymentProduct900SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :refund_reason

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(refund_reason: nil)
          super()
          @refund_reason = refund_reason
        end

        # Sets the property and returns this same instance.
        def with_refund_reason(value)
          @refund_reason = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['refundReason'] = @refund_reason unless @refund_reason.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'refundReason'
            @refund_reason = hash['refundReason']
          end
        end
      end
    end
  end
end
