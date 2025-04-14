#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/apple_pay_recurring_payment_request'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::ApplePayRecurringPaymentRequest] apple_pay_recurring_payment_request
      class MobilePaymentProduct302SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :apple_pay_recurring_payment_request

        # @return (Hash)
        def to_h
          hash = super
          hash['applePayRecurringPaymentRequest'] = @apple_pay_recurring_payment_request.to_h unless @apple_pay_recurring_payment_request.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'applePayRecurringPaymentRequest'
            raise TypeError, "value '%s' is not a Hash" % [hash['applePayRecurringPaymentRequest']] unless hash['applePayRecurringPaymentRequest'].is_a? Hash
            @apple_pay_recurring_payment_request = OnlinePayments::SDK::Domain::ApplePayRecurringPaymentRequest.new_from_hash(hash['applePayRecurringPaymentRequest'])
          end
        end
      end
    end
  end
end
