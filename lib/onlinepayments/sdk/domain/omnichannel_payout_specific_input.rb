#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] payment_id
    class OmnichannelPayoutSpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :payment_id

      # @return (Hash)
      def to_h
        hash = super
        hash['paymentId'] = @payment_id unless @payment_id.nil?
        hash
      end

      def from_hash(hash)
        super
        @payment_id = hash['paymentId'] if hash.key? 'paymentId'
      end
    end
  end
end
