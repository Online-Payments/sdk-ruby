# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] total_amount_paid
      # @attr [Integer, nil] total_amount_refunded
      class RefundRedirectMethodSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :total_amount_paid

        attr_accessor :total_amount_refunded

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(total_amount_paid: nil, total_amount_refunded: nil)
          super()
          @total_amount_paid = total_amount_paid
          @total_amount_refunded = total_amount_refunded
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
          hash['totalAmountPaid'] = @total_amount_paid unless @total_amount_paid.nil?
          hash['totalAmountRefunded'] = @total_amount_refunded unless @total_amount_refunded.nil?
          hash
        end

        def from_hash(hash)
          super
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
