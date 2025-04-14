#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] merchant_finance_code
      class PaymentProduct3209SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :merchant_finance_code

        # @return (Hash)
        def to_h
          hash = super
          hash['merchantFinanceCode'] = @merchant_finance_code unless @merchant_finance_code.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'merchantFinanceCode'
            @merchant_finance_code = hash['merchantFinanceCode']
          end
        end
      end
    end
  end
end
