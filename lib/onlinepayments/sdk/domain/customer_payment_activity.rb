#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer] number_of_payment_attempts_last24_hours
      # @attr [Integer] number_of_payment_attempts_last_year
      # @attr [Integer] number_of_purchases_last6_months
      class CustomerPaymentActivity < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :number_of_payment_attempts_last24_hours

        attr_accessor :number_of_payment_attempts_last_year

        attr_accessor :number_of_purchases_last6_months

        # @return (Hash)
        def to_h
          hash = super
          hash['numberOfPaymentAttemptsLast24Hours'] = @number_of_payment_attempts_last24_hours unless @number_of_payment_attempts_last24_hours.nil?
          hash['numberOfPaymentAttemptsLastYear'] = @number_of_payment_attempts_last_year unless @number_of_payment_attempts_last_year.nil?
          hash['numberOfPurchasesLast6Months'] = @number_of_purchases_last6_months unless @number_of_purchases_last6_months.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'numberOfPaymentAttemptsLast24Hours'
            @number_of_payment_attempts_last24_hours = hash['numberOfPaymentAttemptsLast24Hours']
          end
          if hash.has_key? 'numberOfPaymentAttemptsLastYear'
            @number_of_payment_attempts_last_year = hash['numberOfPaymentAttemptsLastYear']
          end
          if hash.has_key? 'numberOfPurchasesLast6Months'
            @number_of_purchases_last6_months = hash['numberOfPurchasesLast6Months']
          end
        end
      end
    end
  end
end
