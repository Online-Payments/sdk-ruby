#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] surcharge_mode
    class SurchargeForPaymentLink < OnlinePayments::SDK::DataObject
      attr_accessor :surcharge_mode

      # @return (Hash)
      def to_h
        hash = super
        hash['surchargeMode'] = @surcharge_mode unless @surcharge_mode.nil?
        hash
      end

      def from_hash(hash)
        super
        @surcharge_mode = hash['surchargeMode'] if hash.key? 'surchargeMode'
      end
    end
  end
end
