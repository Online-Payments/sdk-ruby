#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] acquirer_id
      # @attr [String, nil] acquirer_mid
      # @attr [String, nil] requestor_id
      class ThreeDsInputData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acquirer_id

        attr_accessor :acquirer_mid

        attr_accessor :requestor_id

        # @return (Hash)
        def to_h
          hash = super
          hash['acquirerId'] = @acquirer_id unless @acquirer_id.nil?
          hash['acquirerMid'] = @acquirer_mid unless @acquirer_mid.nil?
          hash['requestorId'] = @requestor_id unless @requestor_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'acquirerId'
            @acquirer_id = hash['acquirerId']
          end
          if hash.has_key? 'acquirerMid'
            @acquirer_mid = hash['acquirerMid']
          end
          if hash.has_key? 'requestorId'
            @requestor_id = hash['requestorId']
          end
        end
      end
    end
  end
end
