#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount
      class Transaction < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount

        # @return (Hash)
        def to_h
          hash = super
          hash['amount'] = @amount.to_h unless @amount.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amount'
            raise TypeError, "value '%s' is not a Hash" % [hash['amount']] unless hash['amount'].is_a? Hash
            @amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amount'])
          end
        end
      end
    end
  end
end
