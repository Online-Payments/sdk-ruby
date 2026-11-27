# frozen_string_literal: true

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
      # @attr [OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInputBase, nil] card_payment_method_specific_input
      # @attr [OnlinePayments::SDK::Domain::Feedbacks, nil] feedbacks
      # @attr [OnlinePayments::SDK::Domain::FraudFields, nil] fraud_fields
      # @attr [OnlinePayments::SDK::Domain::HostedCheckoutSpecificInput, nil] hosted_checkout_specific_input
      # @attr [OnlinePayments::SDK::Domain::MobilePaymentMethodHostedCheckoutSpecificInput, nil] mobile_payment_method_specific_input
      # @attr [OnlinePayments::SDK::Domain::Order, nil] order
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentMethodSpecificInput, nil] redirect_payment_method_specific_input
      # @attr [OnlinePayments::SDK::Domain::SepaDirectDebitPaymentMethodSpecificInputBase, nil] sepa_direct_debit_payment_method_specific_input
      class CreateHostedCheckoutRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_payment_method_specific_input

        attr_accessor :feedbacks

        attr_accessor :fraud_fields

        attr_accessor :hosted_checkout_specific_input

        attr_accessor :mobile_payment_method_specific_input

        attr_accessor :order

        attr_accessor :redirect_payment_method_specific_input

        attr_accessor :sepa_direct_debit_payment_method_specific_input

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(card_payment_method_specific_input: nil,
                       feedbacks: nil,
                       fraud_fields: nil,
                       hosted_checkout_specific_input: nil,
                       mobile_payment_method_specific_input: nil,
                       order: nil,
                       redirect_payment_method_specific_input: nil,
                       sepa_direct_debit_payment_method_specific_input: nil)
          super()
          @card_payment_method_specific_input = card_payment_method_specific_input
          @feedbacks = feedbacks
          @fraud_fields = fraud_fields
          @hosted_checkout_specific_input = hosted_checkout_specific_input
          @mobile_payment_method_specific_input = mobile_payment_method_specific_input
          @order = order
          @redirect_payment_method_specific_input = redirect_payment_method_specific_input
          @sepa_direct_debit_payment_method_specific_input = sepa_direct_debit_payment_method_specific_input
        end

        # Sets the property and returns this same instance.
        def with_card_payment_method_specific_input(value)
          @card_payment_method_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_feedbacks(value)
          @feedbacks = value
          self
        end

        # Sets the property and returns this same instance.
        def with_fraud_fields(value)
          @fraud_fields = value
          self
        end

        # Sets the property and returns this same instance.
        def with_hosted_checkout_specific_input(value)
          @hosted_checkout_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_mobile_payment_method_specific_input(value)
          @mobile_payment_method_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_order(value)
          @order = value
          self
        end

        # Sets the property and returns this same instance.
        def with_redirect_payment_method_specific_input(value)
          @redirect_payment_method_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_sepa_direct_debit_payment_method_specific_input(value)
          @sepa_direct_debit_payment_method_specific_input = value
          self
        end

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
          if hash.key? 'cardPaymentMethodSpecificInput'
            raise TypeError, "value '#{hash['cardPaymentMethodSpecificInput']}' is not a Hash" unless hash['cardPaymentMethodSpecificInput'].is_a? Hash
            @card_payment_method_specific_input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInputBase.new_from_hash(hash['cardPaymentMethodSpecificInput'])
          end
          if hash.key? 'feedbacks'
            raise TypeError, "value '#{hash['feedbacks']}' is not a Hash" unless hash['feedbacks'].is_a? Hash
            @feedbacks = OnlinePayments::SDK::Domain::Feedbacks.new_from_hash(hash['feedbacks'])
          end
          if hash.key? 'fraudFields'
            raise TypeError, "value '#{hash['fraudFields']}' is not a Hash" unless hash['fraudFields'].is_a? Hash
            @fraud_fields = OnlinePayments::SDK::Domain::FraudFields.new_from_hash(hash['fraudFields'])
          end
          if hash.key? 'hostedCheckoutSpecificInput'
            raise TypeError, "value '#{hash['hostedCheckoutSpecificInput']}' is not a Hash" unless hash['hostedCheckoutSpecificInput'].is_a? Hash
            @hosted_checkout_specific_input = OnlinePayments::SDK::Domain::HostedCheckoutSpecificInput.new_from_hash(hash['hostedCheckoutSpecificInput'])
          end
          if hash.key? 'mobilePaymentMethodSpecificInput'
            raise TypeError, "value '#{hash['mobilePaymentMethodSpecificInput']}' is not a Hash" unless hash['mobilePaymentMethodSpecificInput'].is_a? Hash
            @mobile_payment_method_specific_input = OnlinePayments::SDK::Domain::MobilePaymentMethodHostedCheckoutSpecificInput.new_from_hash(hash['mobilePaymentMethodSpecificInput'])
          end
          if hash.key? 'order'
            raise TypeError, "value '#{hash['order']}' is not a Hash" unless hash['order'].is_a? Hash
            @order = OnlinePayments::SDK::Domain::Order.new_from_hash(hash['order'])
          end
          if hash.key? 'redirectPaymentMethodSpecificInput'
            raise TypeError, "value '#{hash['redirectPaymentMethodSpecificInput']}' is not a Hash" unless hash['redirectPaymentMethodSpecificInput'].is_a? Hash
            @redirect_payment_method_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentMethodSpecificInput.new_from_hash(hash['redirectPaymentMethodSpecificInput'])
          end
          if hash.key? 'sepaDirectDebitPaymentMethodSpecificInput'
            raise TypeError, "value '#{hash['sepaDirectDebitPaymentMethodSpecificInput']}' is not a Hash" unless hash['sepaDirectDebitPaymentMethodSpecificInput'].is_a? Hash
            @sepa_direct_debit_payment_method_specific_input = OnlinePayments::SDK::Domain::SepaDirectDebitPaymentMethodSpecificInputBase.new_from_hash(hash['sepaDirectDebitPaymentMethodSpecificInput'])
          end
        end
      end
    end
  end
end
