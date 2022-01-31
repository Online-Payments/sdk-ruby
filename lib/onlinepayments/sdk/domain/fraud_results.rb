#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] fraud_service_result
    class FraudResults < OnlinePayments::SDK::DataObject
      attr_accessor :fraud_service_result

      # @return (Hash)
      def to_h
        hash = super
        hash['fraudServiceResult'] = @fraud_service_result unless @fraud_service_result.nil?
        hash
      end

      def from_hash(hash)
        super
        @fraud_service_result = hash['fraudServiceResult'] if hash.key? 'fraudServiceResult'
      end
    end
  end
end
