#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] merchant_finance_code
    class PaymentProduct3209SpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :merchant_finance_code

      # @return (Hash)
      def to_h
        hash = super
        hash['merchantFinanceCode'] = @merchant_finance_code unless @merchant_finance_code.nil?
        hash
      end

      def from_hash(hash)
        super
        @merchant_finance_code = hash['merchantFinanceCode'] if hash.key? 'merchantFinanceCode'
      end
    end
  end
end
