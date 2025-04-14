#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] fraud_service_result
      class FraudResults < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :fraud_service_result

        # @return (Hash)
        def to_h
          hash = super
          hash['fraudServiceResult'] = @fraud_service_result unless @fraud_service_result.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'fraudServiceResult'
            @fraud_service_result = hash['fraudServiceResult']
          end
        end
      end
    end
  end
end
