#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/amount_of_money'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount
    class Transaction < OnlinePayments::SDK::DataObject
      attr_accessor :amount

      # @return (Hash)
      def to_h
        hash = super
        hash['amount'] = @amount.to_h if @amount
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'amount'
          raise TypeError, "value '%s' is not a Hash" % [hash['amount']] unless hash['amount'].is_a? Hash
          @amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amount'])
        end
      end
    end
  end
end
