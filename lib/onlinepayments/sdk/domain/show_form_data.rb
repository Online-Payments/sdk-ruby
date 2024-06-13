#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/payment_product3012'
require 'onlinepayments/sdk/domain/payment_product5404'
require 'onlinepayments/sdk/domain/payment_product5407'
require 'onlinepayments/sdk/domain/payment_product840'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::PaymentProduct3012] payment_product3012
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct5404] payment_product5404
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct5407] payment_product5407
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct840] payment_product840
    class ShowFormData < OnlinePayments::SDK::DataObject
      attr_accessor :payment_product3012
      attr_accessor :payment_product5404
      attr_accessor :payment_product5407
      attr_accessor :payment_product840

      # @return (Hash)
      def to_h
        hash = super
        hash['paymentProduct3012'] = @payment_product3012.to_h if @payment_product3012
        hash['paymentProduct5404'] = @payment_product5404.to_h if @payment_product5404
        hash['paymentProduct5407'] = @payment_product5407.to_h if @payment_product5407
        hash['paymentProduct840'] = @payment_product840.to_h if @payment_product840
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'paymentProduct3012'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3012']] unless hash['paymentProduct3012'].is_a? Hash
          @payment_product3012 = OnlinePayments::SDK::Domain::PaymentProduct3012.new_from_hash(hash['paymentProduct3012'])
        end
        if hash.key? 'paymentProduct5404'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5404']] unless hash['paymentProduct5404'].is_a? Hash
          @payment_product5404 = OnlinePayments::SDK::Domain::PaymentProduct5404.new_from_hash(hash['paymentProduct5404'])
        end
        if hash.key? 'paymentProduct5407'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5407']] unless hash['paymentProduct5407'].is_a? Hash
          @payment_product5407 = OnlinePayments::SDK::Domain::PaymentProduct5407.new_from_hash(hash['paymentProduct5407'])
        end
        if hash.key? 'paymentProduct840'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct840']] unless hash['paymentProduct840'].is_a? Hash
          @payment_product840 = OnlinePayments::SDK::Domain::PaymentProduct840.new_from_hash(hash['paymentProduct840'])
        end
      end
    end
  end
end
