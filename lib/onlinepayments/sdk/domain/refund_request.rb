#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/payment_references'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
    # @attr [OnlinePayments::SDK::Domain::PaymentReferences] references
    class RefundRequest < OnlinePayments::SDK::DataObject
      attr_accessor :amount_of_money
      attr_accessor :references

      # @return (Hash)
      def to_h
        hash = super
        hash['amountOfMoney'] = @amount_of_money.to_h if @amount_of_money
        hash['references'] = @references.to_h if @references
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'amountOfMoney'
          raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
          @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        if hash.key? 'references'
          raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
          @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
        end
      end
    end
  end
end
