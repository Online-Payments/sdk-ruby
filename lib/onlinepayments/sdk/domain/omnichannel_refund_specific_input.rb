#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] operator_id
      class OmnichannelRefundSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :operator_id

        # @return (Hash)
        def to_h
          hash = super
          hash['operatorId'] = @operator_id unless @operator_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'operatorId'
            @operator_id = hash['operatorId']
          end
        end
      end
    end
  end
end
