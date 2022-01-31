#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/sepa_direct_debit_payment_product771_specific_input_base'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::SepaDirectDebitPaymentProduct771SpecificInputBase] payment_product771_specific_input
    # @attr [Integer] payment_product_id
    class SepaDirectDebitPaymentMethodSpecificInputBase < OnlinePayments::SDK::DataObject
      attr_accessor :payment_product771_specific_input
      attr_accessor :payment_product_id

      # @return (Hash)
      def to_h
        hash = super
        hash['paymentProduct771SpecificInput'] = @payment_product771_specific_input.to_h if @payment_product771_specific_input
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'paymentProduct771SpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct771SpecificInput']] unless hash['paymentProduct771SpecificInput'].is_a? Hash
          @payment_product771_specific_input = OnlinePayments::SDK::Domain::SepaDirectDebitPaymentProduct771SpecificInputBase.new_from_hash(hash['paymentProduct771SpecificInput'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
      end
    end
  end
end
