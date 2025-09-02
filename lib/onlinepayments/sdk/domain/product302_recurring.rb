#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] recurring_payment_sequence_indicator
      class Product302Recurring < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :recurring_payment_sequence_indicator

        # @return (Hash)
        def to_h
          hash = super
          hash['recurringPaymentSequenceIndicator'] = @recurring_payment_sequence_indicator unless @recurring_payment_sequence_indicator.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'recurringPaymentSequenceIndicator'
            @recurring_payment_sequence_indicator = hash['recurringPaymentSequenceIndicator']
          end
        end
      end
    end
  end
end
