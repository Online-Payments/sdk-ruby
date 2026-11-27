# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] merchant_finance_code
      class PaymentProduct3208SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :merchant_finance_code

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(merchant_finance_code: nil)
          super()
          @merchant_finance_code = merchant_finance_code
        end

        # Sets the property and returns this same instance.
        def with_merchant_finance_code(value)
          @merchant_finance_code = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['merchantFinanceCode'] = @merchant_finance_code unless @merchant_finance_code.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'merchantFinanceCode'
            @merchant_finance_code = hash['merchantFinanceCode']
          end
        end
      end
    end
  end
end
