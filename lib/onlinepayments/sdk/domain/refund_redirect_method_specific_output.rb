#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [Long] total_amount_paid
    # @attr [Long] total_amount_refunded
    class RefundRedirectMethodSpecificOutput < OnlinePayments::SDK::DataObject
      attr_accessor :total_amount_paid
      attr_accessor :total_amount_refunded

      # @return (Hash)
      def to_h
        hash = super
        hash['totalAmountPaid'] = @total_amount_paid unless @total_amount_paid.nil?
        hash['totalAmountRefunded'] = @total_amount_refunded unless @total_amount_refunded.nil?
        hash
      end

      def from_hash(hash)
        super
        @total_amount_paid = hash['totalAmountPaid'] if hash.key? 'totalAmountPaid'
        @total_amount_refunded = hash['totalAmountRefunded'] if hash.key? 'totalAmountRefunded'
      end
    end
  end
end
