#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer] amount
      # @attr [String] type
      class AmountBreakdown < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount

        attr_accessor :type

        # @return (Hash)
        def to_h
          hash = super
          hash['amount'] = @amount unless @amount.nil?
          hash['type'] = @type unless @type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amount'
            @amount = hash['amount']
          end
          if hash.has_key? 'type'
            @type = hash['type']
          end
        end
      end
    end
  end
end
