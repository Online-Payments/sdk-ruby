#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/payment_context'

module OnlinePayments::SDK
  module Domain

    # @attr [String] bin
    # @attr [OnlinePayments::SDK::Domain::PaymentContext] payment_context
    class GetIINDetailsRequest < OnlinePayments::SDK::DataObject
      attr_accessor :bin
      attr_accessor :payment_context

      # @return (Hash)
      def to_h
        hash = super
        hash['bin'] = @bin unless @bin.nil?
        hash['paymentContext'] = @payment_context.to_h if @payment_context
        hash
      end

      def from_hash(hash)
        super
        @bin = hash['bin'] if hash.key? 'bin'
        if hash.key? 'paymentContext'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentContext']] unless hash['paymentContext'].is_a? Hash
          @payment_context = OnlinePayments::SDK::Domain::PaymentContext.new_from_hash(hash['paymentContext'])
        end
      end
    end
  end
end
