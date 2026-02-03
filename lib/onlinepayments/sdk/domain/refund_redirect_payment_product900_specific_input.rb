#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] refund_reason
      class RefundRedirectPaymentProduct900SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :refund_reason

        # @return (Hash)
        def to_h
          hash = super
          hash['refundReason'] = @refund_reason unless @refund_reason.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'refundReason'
            @refund_reason = hash['refundReason']
          end
        end
      end
    end
  end
end
