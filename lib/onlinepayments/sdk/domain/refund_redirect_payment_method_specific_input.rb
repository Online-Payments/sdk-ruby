# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/refund_redirect_payment_product900_specific_input'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::RefundRedirectPaymentProduct900SpecificInput, nil] refund_redirect_payment_product900_specific_input
      class RefundRedirectPaymentMethodSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :refund_redirect_payment_product900_specific_input

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(refund_redirect_payment_product900_specific_input: nil)
          super()
          @refund_redirect_payment_product900_specific_input = refund_redirect_payment_product900_specific_input
        end

        # Sets the property and returns this same instance.
        def with_refund_redirect_payment_product900_specific_input(value)
          @refund_redirect_payment_product900_specific_input = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['refundRedirectPaymentProduct900SpecificInput'] = @refund_redirect_payment_product900_specific_input.to_h unless @refund_redirect_payment_product900_specific_input.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'refundRedirectPaymentProduct900SpecificInput'
            raise TypeError, "value '#{hash['refundRedirectPaymentProduct900SpecificInput']}' is not a Hash" unless hash['refundRedirectPaymentProduct900SpecificInput'].is_a? Hash
            @refund_redirect_payment_product900_specific_input = OnlinePayments::SDK::Domain::RefundRedirectPaymentProduct900SpecificInput.new_from_hash(hash['refundRedirectPaymentProduct900SpecificInput'])
          end
        end
      end
    end
  end
end
