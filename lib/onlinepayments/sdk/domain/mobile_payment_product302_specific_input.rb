#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/apple_pay_recurring_payment_request'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/product302_recurring'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::ApplePayRecurringPaymentRequest] apple_pay_recurring_payment_request
      # @attr [true/false] is_recurring
      # @attr [OnlinePayments::SDK::Domain::Product302Recurring] recurring
      # @attr [true/false] tokenize
      class MobilePaymentProduct302SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :apple_pay_recurring_payment_request

        attr_accessor :is_recurring

        attr_accessor :recurring

        attr_accessor :tokenize

        # @return (Hash)
        def to_h
          hash = super
          hash['applePayRecurringPaymentRequest'] = @apple_pay_recurring_payment_request.to_h unless @apple_pay_recurring_payment_request.nil?
          hash['isRecurring'] = @is_recurring unless @is_recurring.nil?
          hash['recurring'] = @recurring.to_h unless @recurring.nil?
          hash['tokenize'] = @tokenize unless @tokenize.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'applePayRecurringPaymentRequest'
            raise TypeError, "value '%s' is not a Hash" % [hash['applePayRecurringPaymentRequest']] unless hash['applePayRecurringPaymentRequest'].is_a? Hash
            @apple_pay_recurring_payment_request = OnlinePayments::SDK::Domain::ApplePayRecurringPaymentRequest.new_from_hash(hash['applePayRecurringPaymentRequest'])
          end
          if hash.has_key? 'isRecurring'
            @is_recurring = hash['isRecurring']
          end
          if hash.has_key? 'recurring'
            raise TypeError, "value '%s' is not a Hash" % [hash['recurring']] unless hash['recurring'].is_a? Hash
            @recurring = OnlinePayments::SDK::Domain::Product302Recurring.new_from_hash(hash['recurring'])
          end
          if hash.has_key? 'tokenize'
            @tokenize = hash['tokenize']
          end
        end
      end
    end
  end
end
