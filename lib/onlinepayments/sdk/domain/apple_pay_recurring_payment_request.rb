#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/apple_pay_line_item'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] billing_agreement
      # @attr [String] management_url
      # @attr [String] payment_description
      # @attr [OnlinePayments::SDK::Domain::ApplePayLineItem] regular_billing
      # @attr [OnlinePayments::SDK::Domain::ApplePayLineItem] trial_billing
      class ApplePayRecurringPaymentRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :billing_agreement

        attr_accessor :management_url

        attr_accessor :payment_description

        attr_accessor :regular_billing

        attr_accessor :trial_billing

        # @return (Hash)
        def to_h
          hash = super
          hash['billingAgreement'] = @billing_agreement unless @billing_agreement.nil?
          hash['managementUrl'] = @management_url unless @management_url.nil?
          hash['paymentDescription'] = @payment_description unless @payment_description.nil?
          hash['regularBilling'] = @regular_billing.to_h unless @regular_billing.nil?
          hash['trialBilling'] = @trial_billing.to_h unless @trial_billing.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'billingAgreement'
            @billing_agreement = hash['billingAgreement']
          end
          if hash.has_key? 'managementUrl'
            @management_url = hash['managementUrl']
          end
          if hash.has_key? 'paymentDescription'
            @payment_description = hash['paymentDescription']
          end
          if hash.has_key? 'regularBilling'
            raise TypeError, "value '%s' is not a Hash" % [hash['regularBilling']] unless hash['regularBilling'].is_a? Hash
            @regular_billing = OnlinePayments::SDK::Domain::ApplePayLineItem.new_from_hash(hash['regularBilling'])
          end
          if hash.has_key? 'trialBilling'
            raise TypeError, "value '%s' is not a Hash" % [hash['trialBilling']] unless hash['trialBilling'].is_a? Hash
            @trial_billing = OnlinePayments::SDK::Domain::ApplePayLineItem.new_from_hash(hash['trialBilling'])
          end
        end
      end
    end
  end
end
