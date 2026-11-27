# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/apple_pay_line_item'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] billing_agreement
      # @attr [String, nil] management_url
      # @attr [String, nil] payment_description
      # @attr [OnlinePayments::SDK::Domain::ApplePayLineItem, nil] regular_billing
      # @attr [OnlinePayments::SDK::Domain::ApplePayLineItem, nil] trial_billing
      class ApplePayRecurringPaymentRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :billing_agreement

        attr_accessor :management_url

        attr_accessor :payment_description

        attr_accessor :regular_billing

        attr_accessor :trial_billing

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(billing_agreement: nil, management_url: nil, payment_description: nil, regular_billing: nil, trial_billing: nil)
          super()
          @billing_agreement = billing_agreement
          @management_url = management_url
          @payment_description = payment_description
          @regular_billing = regular_billing
          @trial_billing = trial_billing
        end

        # Sets the property and returns this same instance.
        def with_billing_agreement(value)
          @billing_agreement = value
          self
        end

        # Sets the property and returns this same instance.
        def with_management_url(value)
          @management_url = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_description(value)
          @payment_description = value
          self
        end

        # Sets the property and returns this same instance.
        def with_regular_billing(value)
          @regular_billing = value
          self
        end

        # Sets the property and returns this same instance.
        def with_trial_billing(value)
          @trial_billing = value
          self
        end

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
          if hash.key? 'billingAgreement'
            @billing_agreement = hash['billingAgreement']
          end
          if hash.key? 'managementUrl'
            @management_url = hash['managementUrl']
          end
          if hash.key? 'paymentDescription'
            @payment_description = hash['paymentDescription']
          end
          if hash.key? 'regularBilling'
            raise TypeError, "value '#{hash['regularBilling']}' is not a Hash" unless hash['regularBilling'].is_a? Hash
            @regular_billing = OnlinePayments::SDK::Domain::ApplePayLineItem.new_from_hash(hash['regularBilling'])
          end
          if hash.key? 'trialBilling'
            raise TypeError, "value '#{hash['trialBilling']}' is not a Hash" unless hash['trialBilling'].is_a? Hash
            @trial_billing = OnlinePayments::SDK::Domain::ApplePayLineItem.new_from_hash(hash['trialBilling'])
          end
        end
      end
    end
  end
end
