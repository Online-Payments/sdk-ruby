#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] adjustable_amount
      class RedirectPaymentProduct5412SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :adjustable_amount

        # @return (Hash)
        def to_h
          hash = super
          hash['adjustableAmount'] = @adjustable_amount unless @adjustable_amount.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'adjustableAmount'
            @adjustable_amount = hash['adjustableAmount']
          end
        end
      end
    end
  end
end
