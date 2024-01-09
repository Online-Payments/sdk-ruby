#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/amount_of_money'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount
    # @attr [String] merchant_reference
    class PaymentLinkOrderInput < OnlinePayments::SDK::DataObject
      attr_accessor :amount
      attr_accessor :merchant_reference

      # @return (Hash)
      def to_h
        hash = super
        hash['amount'] = @amount.to_h if @amount
        hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'amount'
          raise TypeError, "value '%s' is not a Hash" % [hash['amount']] unless hash['amount'].is_a? Hash
          @amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amount'])
        end
        @merchant_reference = hash['merchantReference'] if hash.key? 'merchantReference'
      end
    end
  end
end
