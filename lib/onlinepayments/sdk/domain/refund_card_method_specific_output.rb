#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/currency_conversion'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::CurrencyConversion] currency_conversion
    # @attr [Long] total_amount_paid
    # @attr [Long] total_amount_refunded
    class RefundCardMethodSpecificOutput < OnlinePayments::SDK::DataObject
      attr_accessor :currency_conversion
      attr_accessor :total_amount_paid
      attr_accessor :total_amount_refunded

      # @return (Hash)
      def to_h
        hash = super
        hash['currencyConversion'] = @currency_conversion.to_h if @currency_conversion
        hash['totalAmountPaid'] = @total_amount_paid unless @total_amount_paid.nil?
        hash['totalAmountRefunded'] = @total_amount_refunded unless @total_amount_refunded.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'currencyConversion'
          raise TypeError, "value '%s' is not a Hash" % [hash['currencyConversion']] unless hash['currencyConversion'].is_a? Hash
          @currency_conversion = OnlinePayments::SDK::Domain::CurrencyConversion.new_from_hash(hash['currencyConversion'])
        end
        @total_amount_paid = hash['totalAmountPaid'] if hash.key? 'totalAmountPaid'
        @total_amount_refunded = hash['totalAmountRefunded'] if hash.key? 'totalAmountRefunded'
      end
    end
  end
end
