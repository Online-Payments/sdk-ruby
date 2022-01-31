#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [Long] amount
    # @attr [String] currency_code
    class AmountOfMoney < OnlinePayments::SDK::DataObject
      attr_accessor :amount
      attr_accessor :currency_code

      # @return (Hash)
      def to_h
        hash = super
        hash['amount'] = @amount unless @amount.nil?
        hash['currencyCode'] = @currency_code unless @currency_code.nil?
        hash
      end

      def from_hash(hash)
        super
        @amount = hash['amount'] if hash.key? 'amount'
        @currency_code = hash['currencyCode'] if hash.key? 'currencyCode'
      end
    end
  end
end
