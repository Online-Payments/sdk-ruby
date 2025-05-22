#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] complete_remaining_payment_amount
      class RedirectPaymentProduct5403SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :complete_remaining_payment_amount

        # @return (Hash)
        def to_h
          hash = super
          hash['completeRemainingPaymentAmount'] = @complete_remaining_payment_amount unless @complete_remaining_payment_amount.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'completeRemainingPaymentAmount'
            @complete_remaining_payment_amount = hash['completeRemainingPaymentAmount']
          end
        end
      end
    end
  end
end
