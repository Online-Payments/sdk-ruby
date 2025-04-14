#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] amount
      # @attr [String] label
      # @attr [String] payment_timing
      # @attr [String] recurring_payment_end_date
      # @attr [Integer] recurring_payment_interval_count
      # @attr [String] recurring_payment_interval_unit
      # @attr [String] recurring_payment_start_date
      class ApplePayLineItem < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount

        attr_accessor :label

        attr_accessor :payment_timing

        attr_accessor :recurring_payment_end_date

        attr_accessor :recurring_payment_interval_count

        attr_accessor :recurring_payment_interval_unit

        attr_accessor :recurring_payment_start_date

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
          if hash.has_key? 'amount'
            @amount = hash['amount']
          end
          if hash.has_key? 'label'
            @label = hash['label']
          end
          if hash.has_key? 'paymentTiming'
            @payment_timing = hash['paymentTiming']
          end
          if hash.has_key? 'recurringPaymentEndDate'
            @recurring_payment_end_date = hash['recurringPaymentEndDate']
          end
          if hash.has_key? 'recurringPaymentIntervalCount'
            @recurring_payment_interval_count = hash['recurringPaymentIntervalCount']
          end
          if hash.has_key? 'recurringPaymentIntervalUnit'
            @recurring_payment_interval_unit = hash['recurringPaymentIntervalUnit']
          end
          if hash.has_key? 'recurringPaymentStartDate'
            @recurring_payment_start_date = hash['recurringPaymentStartDate']
          end
        end
      end
    end
  end
end
