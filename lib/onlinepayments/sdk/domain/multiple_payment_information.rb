#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] payment_pattern
    # @attr [Integer] total_number_of_payments
    class MultiplePaymentInformation < OnlinePayments::SDK::DataObject
      attr_accessor :payment_pattern
      attr_accessor :total_number_of_payments

      # @return (Hash)
      def to_h
        hash = super
        hash['paymentPattern'] = @payment_pattern unless @payment_pattern.nil?
        hash['totalNumberOfPayments'] = @total_number_of_payments unless @total_number_of_payments.nil?
        hash
      end

      def from_hash(hash)
        super
        @payment_pattern = hash['paymentPattern'] if hash.key? 'paymentPattern'
        @total_number_of_payments = hash['totalNumberOfPayments'] if hash.key? 'totalNumberOfPayments'
      end
    end
  end
end
