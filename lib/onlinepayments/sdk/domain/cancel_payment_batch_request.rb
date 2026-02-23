#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/cancel_payment_request'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CancelPaymentRequest] cancel
      # @attr [String] payment_id
      class CancelPaymentBatchRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :cancel

        attr_accessor :payment_id

        # @return (Hash)
        def to_h
          hash = super
          hash['cancel'] = @cancel.to_h unless @cancel.nil?
          hash['paymentId'] = @payment_id unless @payment_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cancel'
            raise TypeError, "value '%s' is not a Hash" % [hash['cancel']] unless hash['cancel'].is_a? Hash
            @cancel = OnlinePayments::SDK::Domain::CancelPaymentRequest.new_from_hash(hash['cancel'])
          end
          if hash.has_key? 'paymentId'
            @payment_id = hash['paymentId']
          end
        end
      end
    end
  end
end
