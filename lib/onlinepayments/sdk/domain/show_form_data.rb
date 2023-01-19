#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/payment_product5404'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::PaymentProduct5404] payment_product5404
    class ShowFormData < OnlinePayments::SDK::DataObject
      attr_accessor :payment_product5404

      # @return (Hash)
      def to_h
        hash = super
        hash['paymentProduct5404'] = @payment_product5404.to_h if @payment_product5404
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'paymentProduct5404'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5404']] unless hash['paymentProduct5404'].is_a? Hash
          @payment_product5404 = OnlinePayments::SDK::Domain::PaymentProduct5404.new_from_hash(hash['paymentProduct5404'])
        end
      end
    end
  end
end
