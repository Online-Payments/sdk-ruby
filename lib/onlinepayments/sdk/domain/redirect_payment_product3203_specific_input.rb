#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] checkout_type
    class RedirectPaymentProduct3203SpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :checkout_type

      # @return (Hash)
      def to_h
        hash = super
        hash['checkoutType'] = @checkout_type unless @checkout_type.nil?
        hash
      end

      def from_hash(hash)
        super
        @checkout_type = hash['checkoutType'] if hash.key? 'checkoutType'
      end
    end
  end
end
