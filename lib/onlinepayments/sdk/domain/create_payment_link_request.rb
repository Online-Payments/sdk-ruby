#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/card_payment_method_specific_input_base'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/feedbacks'
require 'onlinepayments/sdk/domain/fraud_fields'
require 'onlinepayments/sdk/domain/hosted_checkout_specific_input'
require 'onlinepayments/sdk/domain/mobile_payment_method_hosted_checkout_specific_input'
require 'onlinepayments/sdk/domain/order'
require 'onlinepayments/sdk/domain/payment_link_order_input'
require 'onlinepayments/sdk/domain/payment_link_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_method_specific_input'
require 'onlinepayments/sdk/domain/sepa_direct_debit_payment_method_specific_input_base'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInputBase] card_payment_method_specific_input
      # @attr [String] description
      # @attr [DateTime] expiration_date
      # @attr [OnlinePayments::SDK::Domain::Feedbacks] feedbacks
      # @attr [OnlinePayments::SDK::Domain::FraudFields] fraud_fields
      # @attr [OnlinePayments::SDK::Domain::HostedCheckoutSpecificInput] hosted_checkout_specific_input
      # @attr [true/false] is_reusable_link
      # @attr [OnlinePayments::SDK::Domain::MobilePaymentMethodHostedCheckoutSpecificInput] mobile_payment_method_specific_input
      # @attr [OnlinePayments::SDK::Domain::Order] order
      # @attr [OnlinePayments::SDK::Domain::PaymentLinkOrderInput] payment_link_order
      # @attr [OnlinePayments::SDK::Domain::PaymentLinkSpecificInput] payment_link_specific_input
      # @attr [String] recipient_name
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentMethodSpecificInput] redirect_payment_method_specific_input
      # @attr [OnlinePayments::SDK::Domain::SepaDirectDebitPaymentMethodSpecificInputBase] sepa_direct_debit_payment_method_specific_input
      class CreatePaymentLinkRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_payment_method_specific_input

        # @deprecated A note related to the created payment link.  Use paymentLinkSpecificInput/description instead.
        attr_accessor :description

        # @deprecated The date after which the payment link will not be usable to complete the payment. The date sent cannot be more than 6 months in the future or a past date. It must also contain the UTC offset.  Use paymentLinkSpecificInput/expirationDate instead.
        attr_accessor :expiration_date

        attr_accessor :feedbacks

        attr_accessor :fraud_fields

        attr_accessor :hosted_checkout_specific_input

        attr_accessor :is_reusable_link

        attr_accessor :mobile_payment_method_specific_input

        attr_accessor :order

        attr_accessor :payment_link_order

        attr_accessor :payment_link_specific_input

        # @deprecated The payment link recipient name.  Use paymentLinkSpecificInput/recipientName instead.
        attr_accessor :recipient_name

        attr_accessor :redirect_payment_method_specific_input

        attr_accessor :sepa_direct_debit_payment_method_specific_input

        # @return (Hash)
        def to_h
          hash = super
          hash['cardPaymentMethodSpecificInput'] = @card_payment_method_specific_input.to_h unless @card_payment_method_specific_input.nil?
          hash['description'] = @description unless @description.nil?
          hash['expirationDate'] = @expiration_date.iso8601(3) unless @expiration_date.nil?
          hash['feedbacks'] = @feedbacks.to_h unless @feedbacks.nil?
          hash['fraudFields'] = @fraud_fields.to_h unless @fraud_fields.nil?
          hash['hostedCheckoutSpecificInput'] = @hosted_checkout_specific_input.to_h unless @hosted_checkout_specific_input.nil?
          hash['isReusableLink'] = @is_reusable_link unless @is_reusable_link.nil?
          hash['mobilePaymentMethodSpecificInput'] = @mobile_payment_method_specific_input.to_h unless @mobile_payment_method_specific_input.nil?
          hash['order'] = @order.to_h unless @order.nil?
          hash['paymentLinkOrder'] = @payment_link_order.to_h unless @payment_link_order.nil?
          hash['paymentLinkSpecificInput'] = @payment_link_specific_input.to_h unless @payment_link_specific_input.nil?
          hash['recipientName'] = @recipient_name unless @recipient_name.nil?
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
          if hash.has_key? 'description'
            @description = hash['description']
          end
          if hash.has_key? 'expirationDate'
            @expiration_date = DateTime.parse(hash['expirationDate'])
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
          if hash.has_key? 'isReusableLink'
            @is_reusable_link = hash['isReusableLink']
          end
          if hash.has_key? 'mobilePaymentMethodSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['mobilePaymentMethodSpecificInput']] unless hash['mobilePaymentMethodSpecificInput'].is_a? Hash
            @mobile_payment_method_specific_input = OnlinePayments::SDK::Domain::MobilePaymentMethodHostedCheckoutSpecificInput.new_from_hash(hash['mobilePaymentMethodSpecificInput'])
          end
          if hash.has_key? 'order'
            raise TypeError, "value '%s' is not a Hash" % [hash['order']] unless hash['order'].is_a? Hash
            @order = OnlinePayments::SDK::Domain::Order.new_from_hash(hash['order'])
          end
          if hash.has_key? 'paymentLinkOrder'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentLinkOrder']] unless hash['paymentLinkOrder'].is_a? Hash
            @payment_link_order = OnlinePayments::SDK::Domain::PaymentLinkOrderInput.new_from_hash(hash['paymentLinkOrder'])
          end
          if hash.has_key? 'paymentLinkSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentLinkSpecificInput']] unless hash['paymentLinkSpecificInput'].is_a? Hash
            @payment_link_specific_input = OnlinePayments::SDK::Domain::PaymentLinkSpecificInput.new_from_hash(hash['paymentLinkSpecificInput'])
          end
          if hash.has_key? 'recipientName'
            @recipient_name = hash['recipientName']
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
