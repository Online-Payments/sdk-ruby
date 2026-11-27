# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] amount
      # @attr [String, nil] label
      # @attr [String, nil] payment_timing
      # @attr [String, nil] recurring_payment_end_date
      # @attr [Integer, nil] recurring_payment_interval_count
      # @attr [String, nil] recurring_payment_interval_unit
      # @attr [String, nil] recurring_payment_start_date
      class ApplePayLineItem < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount

        attr_accessor :label

        attr_accessor :payment_timing

        attr_accessor :recurring_payment_end_date

        attr_accessor :recurring_payment_interval_count

        attr_accessor :recurring_payment_interval_unit

        attr_accessor :recurring_payment_start_date

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount: nil,
                       label: nil,
                       payment_timing: nil,
                       recurring_payment_end_date: nil,
                       recurring_payment_interval_count: nil,
                       recurring_payment_interval_unit: nil,
                       recurring_payment_start_date: nil)
          super()
          @amount = amount
          @label = label
          @payment_timing = payment_timing
          @recurring_payment_end_date = recurring_payment_end_date
          @recurring_payment_interval_count = recurring_payment_interval_count
          @recurring_payment_interval_unit = recurring_payment_interval_unit
          @recurring_payment_start_date = recurring_payment_start_date
        end

        # Sets the property and returns this same instance.
        def with_amount(value)
          @amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_label(value)
          @label = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_timing(value)
          @payment_timing = value
          self
        end

        # Sets the property and returns this same instance.
        def with_recurring_payment_end_date(value)
          @recurring_payment_end_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_recurring_payment_interval_count(value)
          @recurring_payment_interval_count = value
          self
        end

        # Sets the property and returns this same instance.
        def with_recurring_payment_interval_unit(value)
          @recurring_payment_interval_unit = value
          self
        end

        # Sets the property and returns this same instance.
        def with_recurring_payment_start_date(value)
          @recurring_payment_start_date = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['amount'] = @amount unless @amount.nil?
          hash['label'] = @label unless @label.nil?
          hash['paymentTiming'] = @payment_timing unless @payment_timing.nil?
          hash['recurringPaymentEndDate'] = @recurring_payment_end_date unless @recurring_payment_end_date.nil?
          hash['recurringPaymentIntervalCount'] = @recurring_payment_interval_count unless @recurring_payment_interval_count.nil?
          hash['recurringPaymentIntervalUnit'] = @recurring_payment_interval_unit unless @recurring_payment_interval_unit.nil?
          hash['recurringPaymentStartDate'] = @recurring_payment_start_date unless @recurring_payment_start_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'amount'
            @amount = hash['amount']
          end
          if hash.key? 'label'
            @label = hash['label']
          end
          if hash.key? 'paymentTiming'
            @payment_timing = hash['paymentTiming']
          end
          if hash.key? 'recurringPaymentEndDate'
            @recurring_payment_end_date = hash['recurringPaymentEndDate']
          end
          if hash.key? 'recurringPaymentIntervalCount'
            @recurring_payment_interval_count = hash['recurringPaymentIntervalCount']
          end
          if hash.key? 'recurringPaymentIntervalUnit'
            @recurring_payment_interval_unit = hash['recurringPaymentIntervalUnit']
          end
          if hash.key? 'recurringPaymentStartDate'
            @recurring_payment_start_date = hash['recurringPaymentStartDate']
          end
        end
      end
    end
  end
end
