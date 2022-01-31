#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/payment_response'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::PaymentResponse] payment
    class CancelPaymentResponse < OnlinePayments::SDK::DataObject
      attr_accessor :payment

      # @return (Hash)
      def to_h
        hash = super
        hash['payment'] = @payment.to_h if @payment
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'payment'
          raise TypeError, "value '%s' is not a Hash" % [hash['payment']] unless hash['payment'].is_a? Hash
          @payment = OnlinePayments::SDK::Domain::PaymentResponse.new_from_hash(hash['payment'])
        end
      end
    end
  end
end
