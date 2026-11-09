#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] installment_payment_sequence_indicator
      class CardInstallmentDetails < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :installment_payment_sequence_indicator

        # Sets the property and returns this same instance.
        def with_installment_payment_sequence_indicator(value)
          @installment_payment_sequence_indicator = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['installmentPaymentSequenceIndicator'] = @installment_payment_sequence_indicator unless @installment_payment_sequence_indicator.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'installmentPaymentSequenceIndicator'
            @installment_payment_sequence_indicator = hash['installmentPaymentSequenceIndicator']
          end
        end
      end
    end
  end
end
