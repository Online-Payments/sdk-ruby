#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer] amount
      class Discount < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount

        # @return (Hash)
        def to_h
          hash = super
          hash['amount'] = @amount unless @amount.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amount'
            @amount = hash['amount']
          end
        end
      end
    end
  end
end
