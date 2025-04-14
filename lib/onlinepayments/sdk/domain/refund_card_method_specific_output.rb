#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/currency_conversion'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CurrencyConversion] currency_conversion
      # @attr [Integer] total_amount_paid
      # @attr [Integer] total_amount_refunded
      class RefundCardMethodSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :currency_conversion

        attr_accessor :total_amount_paid

        attr_accessor :total_amount_refunded

        # @return (Hash)
        def to_h
          hash = super
          hash['currencyConversion'] = @currency_conversion.to_h unless @currency_conversion.nil?
          hash['totalAmountPaid'] = @total_amount_paid unless @total_amount_paid.nil?
          hash['totalAmountRefunded'] = @total_amount_refunded unless @total_amount_refunded.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'currencyConversion'
            raise TypeError, "value '%s' is not a Hash" % [hash['currencyConversion']] unless hash['currencyConversion'].is_a? Hash
            @currency_conversion = OnlinePayments::SDK::Domain::CurrencyConversion.new_from_hash(hash['currencyConversion'])
          end
          if hash.has_key? 'totalAmountPaid'
            @total_amount_paid = hash['totalAmountPaid']
          end
          if hash.has_key? 'totalAmountRefunded'
            @total_amount_refunded = hash['totalAmountRefunded']
          end
        end
      end
    end
  end
end
