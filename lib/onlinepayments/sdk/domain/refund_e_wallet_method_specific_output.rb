#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/refund_payment_product840_specific_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::RefundPaymentProduct840SpecificOutput] payment_product840_specific_output
      # @attr [Integer] total_amount_paid
      # @attr [Integer] total_amount_refunded
      class RefundEWalletMethodSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_product840_specific_output

        attr_accessor :total_amount_paid

        attr_accessor :total_amount_refunded

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentProduct840SpecificOutput'] = @payment_product840_specific_output.to_h unless @payment_product840_specific_output.nil?
          hash['totalAmountPaid'] = @total_amount_paid unless @total_amount_paid.nil?
          hash['totalAmountRefunded'] = @total_amount_refunded unless @total_amount_refunded.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentProduct840SpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct840SpecificOutput']] unless hash['paymentProduct840SpecificOutput'].is_a? Hash
            @payment_product840_specific_output = OnlinePayments::SDK::Domain::RefundPaymentProduct840SpecificOutput.new_from_hash(hash['paymentProduct840SpecificOutput'])
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
