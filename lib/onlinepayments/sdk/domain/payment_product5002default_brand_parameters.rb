#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] src_dpa_id
      # @attr [String, nil] src_initiator_id
      class PaymentProduct5002defaultBrandParameters < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :src_dpa_id

        attr_accessor :src_initiator_id

        # @return (Hash)
        def to_h
          hash = super
          hash['srcDpaId'] = @src_dpa_id unless @src_dpa_id.nil?
          hash['srcInitiatorId'] = @src_initiator_id unless @src_initiator_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'srcDpaId'
            @src_dpa_id = hash['srcDpaId']
          end
          if hash.has_key? 'srcInitiatorId'
            @src_initiator_id = hash['srcInitiatorId']
          end
        end
      end
    end
  end
end
