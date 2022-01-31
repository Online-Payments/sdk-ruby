#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/payment_product130_specific_three_d_secure'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::PaymentProduct130SpecificThreeDSecure] three_d_secure
    class PaymentProduct130SpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :three_d_secure

      # @return (Hash)
      def to_h
        hash = super
        hash['threeDSecure'] = @three_d_secure.to_h if @three_d_secure
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'threeDSecure'
          raise TypeError, "value '%s' is not a Hash" % [hash['threeDSecure']] unless hash['threeDSecure'].is_a? Hash
          @three_d_secure = OnlinePayments::SDK::Domain::PaymentProduct130SpecificThreeDSecure.new_from_hash(hash['threeDSecure'])
        end
      end
    end
  end
end
