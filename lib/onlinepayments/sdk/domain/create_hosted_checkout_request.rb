#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card_payment_method_specific_input_base'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/feedbacks'
require 'onlinepayments/sdk/domain/fraud_fields'
require 'onlinepayments/sdk/domain/hosted_checkout_specific_input'
require 'onlinepayments/sdk/domain/mobile_payment_method_hosted_checkout_specific_input'
require 'onlinepayments/sdk/domain/order'
require 'onlinepayments/sdk/domain/redirect_payment_method_specific_input'
require 'onlinepayments/sdk/domain/sepa_direct_debit_payment_method_specific_input_base'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInputBase] card_payment_method_specific_input
      # @attr [OnlinePayments::SDK::Domain::Feedbacks] feedbacks
      # @attr [OnlinePayments::SDK::Domain::FraudFields] fraud_fields
      # @attr [OnlinePayments::SDK::Domain::HostedCheckoutSpecificInput] hosted_checkout_specific_input
      # @attr [OnlinePayments::SDK::Domain::MobilePaymentMethodHostedCheckoutSpecificInput] mobile_payment_method_specific_input
      # @attr [OnlinePayments::SDK::Domain::Order] order
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentMethodSpecificInput] redirect_payment_method_specific_input
      # @attr [OnlinePayments::SDK::Domain::SepaDirectDebitPaymentMethodSpecificInputBase] sepa_direct_debit_payment_method_specific_input
      class CreateHostedCheckoutRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_payment_method_specific_input

        attr_accessor :feedbacks

        attr_accessor :fraud_fields

        attr_accessor :hosted_checkout_specific_input

        attr_accessor :mobile_payment_method_specific_input

        attr_accessor :order

        attr_accessor :redirect_payment_method_specific_input

        attr_accessor :sepa_direct_debit_payment_method_specific_input

        # @return (Hash)
        def to_h
          hash = super
          hash['cardPaymentMethodSpecificInput'] = @card_payment_method_specific_input.to_h unless @card_payment_method_specific_input.nil?
          hash['feedbacks'] = @feedbacks.to_h unless @feedbacks.nil?
          hash['fraudFields'] = @fraud_fields.to_h unless @fraud_fields.nil?
          hash['hostedCheckoutSpecificInput'] = @hosted_checkout_specific_input.to_h unless @hosted_checkout_specific_input.nil?
          hash['mobilePaymentMethodSpecificInput'] = @mobile_payment_method_specific_input.to_h unless @mobile_payment_method_specific_input.nil?
          hash['order'] = @order.to_h unless @order.nil?
          hash['redirectPaymentMethodSpecificInput'] = @redirect_payment_method_specific_input.to_h unless @redirect_payment_method_specific_input.nil?
          hash['sepaDirectDebitPaymentMethodSpecificInput'] = @sepa_direct_debit_payment_method_specific_input.to_h unless @sepa_direct_debit_payment_method_specific_input.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cardPaymentMethodSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['cardPaymentMethodSpecificInput']] unless hash['cardPaymentMethodSpecificInput'].is_a? Hash
            @card_payment_method_specific_input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInputBase.new_from_hash(hash['cardPaymentMethodSpecificInput'])
          end
          if hash.has_key? 'feedbacks'
            raise TypeError, "value '%s' is not a Hash" % [hash['feedbacks']] unless hash['feedbacks'].is_a? Hash
            @feedbacks = OnlinePayments::SDK::Domain::Feedbacks.new_from_hash(hash['feedbacks'])
          end
          if hash.has_key? 'fraudFields'
            raise TypeError, "value '%s' is not a Hash" % [hash['fraudFields']] unless hash['fraudFields'].is_a? Hash
            @fraud_fields = OnlinePayments::SDK::Domain::FraudFields.new_from_hash(hash['fraudFields'])
          end
          if hash.has_key? 'hostedCheckoutSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['hostedCheckoutSpecificInput']] unless hash['hostedCheckoutSpecificInput'].is_a? Hash
            @hosted_checkout_specific_input = OnlinePayments::SDK::Domain::HostedCheckoutSpecificInput.new_from_hash(hash['hostedCheckoutSpecificInput'])
          end
          if hash.has_key? 'mobilePaymentMethodSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['mobilePaymentMethodSpecificInput']] unless hash['mobilePaymentMethodSpecificInput'].is_a? Hash
            @mobile_payment_method_specific_input = OnlinePayments::SDK::Domain::MobilePaymentMethodHostedCheckoutSpecificInput.new_from_hash(hash['mobilePaymentMethodSpecificInput'])
          end
          if hash.has_key? 'order'
            raise TypeError, "value '%s' is not a Hash" % [hash['order']] unless hash['order'].is_a? Hash
            @order = OnlinePayments::SDK::Domain::Order.new_from_hash(hash['order'])
          end
          if hash.has_key? 'redirectPaymentMethodSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['redirectPaymentMethodSpecificInput']] unless hash['redirectPaymentMethodSpecificInput'].is_a? Hash
            @redirect_payment_method_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentMethodSpecificInput.new_from_hash(hash['redirectPaymentMethodSpecificInput'])
          end
          if hash.has_key? 'sepaDirectDebitPaymentMethodSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['sepaDirectDebitPaymentMethodSpecificInput']] unless hash['sepaDirectDebitPaymentMethodSpecificInput'].is_a? Hash
            @sepa_direct_debit_payment_method_specific_input = OnlinePayments::SDK::Domain::SepaDirectDebitPaymentMethodSpecificInputBase.new_from_hash(hash['sepaDirectDebitPaymentMethodSpecificInput'])
          end
        end
      end
    end
  end
end
