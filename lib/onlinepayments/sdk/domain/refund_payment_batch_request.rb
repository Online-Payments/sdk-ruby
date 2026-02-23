#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/refund_request'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] payment_id
      # @attr [OnlinePayments::SDK::Domain::RefundRequest] refund
      class RefundPaymentBatchRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_id

        attr_accessor :refund

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentId'] = @payment_id unless @payment_id.nil?
          hash['refund'] = @refund.to_h unless @refund.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentId'
            @payment_id = hash['paymentId']
          end
          if hash.has_key? 'refund'
            raise TypeError, "value '%s' is not a Hash" % [hash['refund']] unless hash['refund'].is_a? Hash
            @refund = OnlinePayments::SDK::Domain::RefundRequest.new_from_hash(hash['refund'])
          end
        end
      end
    end
  end
end
