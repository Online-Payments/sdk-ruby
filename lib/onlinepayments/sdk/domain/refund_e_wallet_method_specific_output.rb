# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/refund_payment_product840_specific_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::RefundPaymentProduct840SpecificOutput, nil] payment_product840_specific_output
      # @attr [Integer, nil] total_amount_paid
      # @attr [Integer, nil] total_amount_refunded
      class RefundEWalletMethodSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_product840_specific_output

        attr_accessor :total_amount_paid

        attr_accessor :total_amount_refunded

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(payment_product840_specific_output: nil, total_amount_paid: nil, total_amount_refunded: nil)
          super()
          @payment_product840_specific_output = payment_product840_specific_output
          @total_amount_paid = total_amount_paid
          @total_amount_refunded = total_amount_refunded
        end

        # Sets the property and returns this same instance.
        def with_payment_product840_specific_output(value)
          @payment_product840_specific_output = value
          self
        end

        # Sets the property and returns this same instance.
        def with_total_amount_paid(value)
          @total_amount_paid = value
          self
        end

        # Sets the property and returns this same instance.
        def with_total_amount_refunded(value)
          @total_amount_refunded = value
          self
        end

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
          if hash.key? 'paymentProduct840SpecificOutput'
            raise TypeError, "value '#{hash['paymentProduct840SpecificOutput']}' is not a Hash" unless hash['paymentProduct840SpecificOutput'].is_a? Hash
            @payment_product840_specific_output = OnlinePayments::SDK::Domain::RefundPaymentProduct840SpecificOutput.new_from_hash(hash['paymentProduct840SpecificOutput'])
          end
          if hash.key? 'totalAmountPaid'
            @total_amount_paid = hash['totalAmountPaid']
          end
          if hash.key? 'totalAmountRefunded'
            @total_amount_refunded = hash['totalAmountRefunded']
          end
        end
      end
    end
  end
end
