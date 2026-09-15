#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] operator_id
      # @attr [String, nil] payment_id
      class OmnichannelPayoutSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :operator_id

        attr_accessor :payment_id

        # @return (Hash)
        def to_h
          hash = super
          hash['operatorId'] = @operator_id unless @operator_id.nil?
          hash['paymentId'] = @payment_id unless @payment_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'operatorId'
            @operator_id = hash['operatorId']
          end
          if hash.has_key? 'paymentId'
            @payment_id = hash['paymentId']
          end
        end
      end
    end
  end
end
