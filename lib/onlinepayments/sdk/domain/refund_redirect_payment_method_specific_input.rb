#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/refund_redirect_payment_product900_specific_input'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::RefundRedirectPaymentProduct900SpecificInput] refund_redirect_payment_product900_specific_input
      class RefundRedirectPaymentMethodSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :refund_redirect_payment_product900_specific_input

        # @return (Hash)
        def to_h
          hash = super
          hash['refundRedirectPaymentProduct900SpecificInput'] = @refund_redirect_payment_product900_specific_input.to_h unless @refund_redirect_payment_product900_specific_input.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'refundRedirectPaymentProduct900SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['refundRedirectPaymentProduct900SpecificInput']] unless hash['refundRedirectPaymentProduct900SpecificInput'].is_a? Hash
            @refund_redirect_payment_product900_specific_input = OnlinePayments::SDK::Domain::RefundRedirectPaymentProduct900SpecificInput.new_from_hash(hash['refundRedirectPaymentProduct900SpecificInput'])
          end
        end
      end
    end
  end
end
