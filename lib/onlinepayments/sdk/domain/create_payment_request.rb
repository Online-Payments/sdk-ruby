#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/card_payment_method_specific_input'
require 'onlinepayments/sdk/domain/fraud_fields'
require 'onlinepayments/sdk/domain/mobile_payment_method_specific_input'
require 'onlinepayments/sdk/domain/order'
require 'onlinepayments/sdk/domain/redirect_payment_method_specific_input'
require 'onlinepayments/sdk/domain/sepa_direct_debit_payment_method_specific_input'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInput] card_payment_method_specific_input
    # @attr [String] encrypted_customer_input
    # @attr [OnlinePayments::SDK::Domain::FraudFields] fraud_fields
    # @attr [OnlinePayments::SDK::Domain::MobilePaymentMethodSpecificInput] mobile_payment_method_specific_input
    # @attr [OnlinePayments::SDK::Domain::Order] order
    # @attr [OnlinePayments::SDK::Domain::RedirectPaymentMethodSpecificInput] redirect_payment_method_specific_input
    # @attr [OnlinePayments::SDK::Domain::SepaDirectDebitPaymentMethodSpecificInput] sepa_direct_debit_payment_method_specific_input
    class CreatePaymentRequest < OnlinePayments::SDK::DataObject
      attr_accessor :card_payment_method_specific_input
      attr_accessor :encrypted_customer_input
      attr_accessor :fraud_fields
      attr_accessor :mobile_payment_method_specific_input
      attr_accessor :order
      attr_accessor :redirect_payment_method_specific_input
      attr_accessor :sepa_direct_debit_payment_method_specific_input

      # @return (Hash)
      def to_h
        hash = super
        hash['cardPaymentMethodSpecificInput'] = @card_payment_method_specific_input.to_h if @card_payment_method_specific_input
        hash['encryptedCustomerInput'] = @encrypted_customer_input unless @encrypted_customer_input.nil?
        hash['fraudFields'] = @fraud_fields.to_h if @fraud_fields
        hash['mobilePaymentMethodSpecificInput'] = @mobile_payment_method_specific_input.to_h if @mobile_payment_method_specific_input
        hash['order'] = @order.to_h if @order
        hash['redirectPaymentMethodSpecificInput'] = @redirect_payment_method_specific_input.to_h if @redirect_payment_method_specific_input
        hash['sepaDirectDebitPaymentMethodSpecificInput'] = @sepa_direct_debit_payment_method_specific_input.to_h if @sepa_direct_debit_payment_method_specific_input
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'cardPaymentMethodSpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['cardPaymentMethodSpecificInput']] unless hash['cardPaymentMethodSpecificInput'].is_a? Hash
          @card_payment_method_specific_input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInput.new_from_hash(hash['cardPaymentMethodSpecificInput'])
        end
        @encrypted_customer_input = hash['encryptedCustomerInput'] if hash.key? 'encryptedCustomerInput'
        if hash.key? 'fraudFields'
          raise TypeError, "value '%s' is not a Hash" % [hash['fraudFields']] unless hash['fraudFields'].is_a? Hash
          @fraud_fields = OnlinePayments::SDK::Domain::FraudFields.new_from_hash(hash['fraudFields'])
        end
        if hash.key? 'mobilePaymentMethodSpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['mobilePaymentMethodSpecificInput']] unless hash['mobilePaymentMethodSpecificInput'].is_a? Hash
          @mobile_payment_method_specific_input = OnlinePayments::SDK::Domain::MobilePaymentMethodSpecificInput.new_from_hash(hash['mobilePaymentMethodSpecificInput'])
        end
        if hash.key? 'order'
          raise TypeError, "value '%s' is not a Hash" % [hash['order']] unless hash['order'].is_a? Hash
          @order = OnlinePayments::SDK::Domain::Order.new_from_hash(hash['order'])
        end
        if hash.key? 'redirectPaymentMethodSpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['redirectPaymentMethodSpecificInput']] unless hash['redirectPaymentMethodSpecificInput'].is_a? Hash
          @redirect_payment_method_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentMethodSpecificInput.new_from_hash(hash['redirectPaymentMethodSpecificInput'])
        end
        if hash.key? 'sepaDirectDebitPaymentMethodSpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['sepaDirectDebitPaymentMethodSpecificInput']] unless hash['sepaDirectDebitPaymentMethodSpecificInput'].is_a? Hash
          @sepa_direct_debit_payment_method_specific_input = OnlinePayments::SDK::Domain::SepaDirectDebitPaymentMethodSpecificInput.new_from_hash(hash['sepaDirectDebitPaymentMethodSpecificInput'])
        end
      end
    end
  end
end
