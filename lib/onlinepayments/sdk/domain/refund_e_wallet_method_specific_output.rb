#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/refund_payment_product840_specific_output'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::RefundPaymentProduct840SpecificOutput] payment_product840_specific_output
    # @attr [Long] total_amount_paid
    # @attr [Long] total_amount_refunded
    class RefundEWalletMethodSpecificOutput < OnlinePayments::SDK::DataObject
      attr_accessor :payment_product840_specific_output
      attr_accessor :total_amount_paid
      attr_accessor :total_amount_refunded

      # @return (Hash)
      def to_h
        hash = super
        hash['paymentProduct840SpecificOutput'] = @payment_product840_specific_output.to_h if @payment_product840_specific_output
        hash['totalAmountPaid'] = @total_amount_paid unless @total_amount_paid.nil?
        hash['totalAmountRefunded'] = @total_amount_refunded unless @total_amount_refunded.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'paymentProduct840SpecificOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct840SpecificOutput']] unless hash['paymentProduct840SpecificOutput'].is_a? Hash
          @payment_product840_specific_output = OnlinePayments::SDK::Domain::RefundPaymentProduct840SpecificOutput.new_from_hash(hash['paymentProduct840SpecificOutput'])
        end
        @total_amount_paid = hash['totalAmountPaid'] if hash.key? 'totalAmountPaid'
        @total_amount_refunded = hash['totalAmountRefunded'] if hash.key? 'totalAmountRefunded'
      end
    end
  end
end
