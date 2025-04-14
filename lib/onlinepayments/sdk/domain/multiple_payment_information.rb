#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] payment_pattern
      # @attr [Integer] total_number_of_payments
      class MultiplePaymentInformation < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_pattern

        attr_accessor :total_number_of_payments

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentPattern'] = @payment_pattern unless @payment_pattern.nil?
          hash['totalNumberOfPayments'] = @total_number_of_payments unless @total_number_of_payments.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentPattern'
            @payment_pattern = hash['paymentPattern']
          end
          if hash.has_key? 'totalNumberOfPayments'
            @total_number_of_payments = hash['totalNumberOfPayments']
          end
        end
      end
    end
  end
end
