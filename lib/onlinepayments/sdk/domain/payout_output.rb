#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/amount_of_money'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
    class PayoutOutput < OnlinePayments::SDK::DataObject
      attr_accessor :amount_of_money

      # @return (Hash)
      def to_h
        hash = super
        hash['amountOfMoney'] = @amount_of_money.to_h if @amount_of_money
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'amountOfMoney'
          raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
          @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
      end
    end
  end
end
