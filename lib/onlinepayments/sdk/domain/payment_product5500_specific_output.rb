#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] payment_end_date
    # @attr [String] payment_reference
    # @attr [String] payment_start_date
    class PaymentProduct5500SpecificOutput < OnlinePayments::SDK::DataObject
      attr_accessor :payment_end_date
      attr_accessor :payment_reference
      attr_accessor :payment_start_date

      # @return (Hash)
      def to_h
        hash = super
        hash['paymentEndDate'] = @payment_end_date unless @payment_end_date.nil?
        hash['paymentReference'] = @payment_reference unless @payment_reference.nil?
        hash['paymentStartDate'] = @payment_start_date unless @payment_start_date.nil?
        hash
      end

      def from_hash(hash)
        super
        @payment_end_date = hash['paymentEndDate'] if hash.key? 'paymentEndDate'
        @payment_reference = hash['paymentReference'] if hash.key? 'paymentReference'
        @payment_start_date = hash['paymentStartDate'] if hash.key? 'paymentStartDate'
      end
    end
  end
end
