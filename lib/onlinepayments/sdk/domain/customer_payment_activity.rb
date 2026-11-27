# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] number_of_payment_attempts_last24_hours
      # @attr [Integer, nil] number_of_payment_attempts_last_year
      # @attr [Integer, nil] number_of_purchases_last6_months
      class CustomerPaymentActivity < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :number_of_payment_attempts_last24_hours

        attr_accessor :number_of_payment_attempts_last_year

        attr_accessor :number_of_purchases_last6_months

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(number_of_payment_attempts_last24_hours: nil, number_of_payment_attempts_last_year: nil, number_of_purchases_last6_months: nil)
          super()
          @number_of_payment_attempts_last24_hours = number_of_payment_attempts_last24_hours
          @number_of_payment_attempts_last_year = number_of_payment_attempts_last_year
          @number_of_purchases_last6_months = number_of_purchases_last6_months
        end

        # Sets the property and returns this same instance.
        def with_number_of_payment_attempts_last24_hours(value)
          @number_of_payment_attempts_last24_hours = value
          self
        end

        # Sets the property and returns this same instance.
        def with_number_of_payment_attempts_last_year(value)
          @number_of_payment_attempts_last_year = value
          self
        end

        # Sets the property and returns this same instance.
        def with_number_of_purchases_last6_months(value)
          @number_of_purchases_last6_months = value
          self
        end

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
          if hash.key? 'numberOfPaymentAttemptsLast24Hours'
            @number_of_payment_attempts_last24_hours = hash['numberOfPaymentAttemptsLast24Hours']
          end
          if hash.key? 'numberOfPaymentAttemptsLastYear'
            @number_of_payment_attempts_last_year = hash['numberOfPaymentAttemptsLastYear']
          end
          if hash.key? 'numberOfPurchasesLast6Months'
            @number_of_purchases_last6_months = hash['numberOfPurchasesLast6Months']
          end
        end
      end
    end
  end
end
