#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] payment_id
      class OmnichannelPayoutSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_id

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentId'] = @payment_id unless @payment_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentId'
            @payment_id = hash['paymentId']
          end
        end
      end
    end
  end
end
