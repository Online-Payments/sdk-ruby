#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/subsequent_payment_request'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] payment_id
      # @attr [OnlinePayments::SDK::Domain::SubsequentPaymentRequest] subsequent
      class SubsequentPaymentBatchRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_id

        attr_accessor :subsequent

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentId'] = @payment_id unless @payment_id.nil?
          hash['subsequent'] = @subsequent.to_h unless @subsequent.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentId'
            @payment_id = hash['paymentId']
          end
          if hash.has_key? 'subsequent'
            raise TypeError, "value '%s' is not a Hash" % [hash['subsequent']] unless hash['subsequent'].is_a? Hash
            @subsequent = OnlinePayments::SDK::Domain::SubsequentPaymentRequest.new_from_hash(hash['subsequent'])
          end
        end
      end
    end
  end
end
