#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/card_payment_method_specific_output'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mobile_payment_method_specific_output'
require 'onlinepayments/sdk/domain/operation_payment_references'
require 'onlinepayments/sdk/domain/payment_references'
require 'onlinepayments/sdk/domain/redirect_payment_method_specific_output'
require 'onlinepayments/sdk/domain/sepa_direct_debit_payment_method_specific_output'
require 'onlinepayments/sdk/domain/surcharge_specific_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] acquired_amount
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
      # @attr [Integer] amount_paid
      # @attr [OnlinePayments::SDK::Domain::CardPaymentMethodSpecificOutput] card_payment_method_specific_output
      # @attr [String] merchant_parameters
      # @attr [OnlinePayments::SDK::Domain::MobilePaymentMethodSpecificOutput] mobile_payment_method_specific_output
      # @attr [OnlinePayments::SDK::Domain::OperationPaymentReferences] operation_references
      # @attr [String] payment_method
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentMethodSpecificOutput] redirect_payment_method_specific_output
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences] references
      # @attr [OnlinePayments::SDK::Domain::SepaDirectDebitPaymentMethodSpecificOutput] sepa_direct_debit_payment_method_specific_output
      # @attr [OnlinePayments::SDK::Domain::SurchargeSpecificOutput] surcharge_specific_output
      class CaptureOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acquired_amount

        attr_accessor :amount_of_money

        # @deprecated Amount that has been paid. This is deprecated. Use acquiredAmount instead.
        attr_accessor :amount_paid

        attr_accessor :card_payment_method_specific_output

        attr_accessor :merchant_parameters

        attr_accessor :mobile_payment_method_specific_output

        attr_accessor :operation_references

        attr_accessor :payment_method

        attr_accessor :redirect_payment_method_specific_output

        attr_accessor :references

        attr_accessor :sepa_direct_debit_payment_method_specific_output

        attr_accessor :surcharge_specific_output

        # @return (Hash)
        def to_h
          hash = super
          hash['acquiredAmount'] = @acquired_amount.to_h unless @acquired_amount.nil?
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['amountPaid'] = @amount_paid unless @amount_paid.nil?
          hash['cardPaymentMethodSpecificOutput'] = @card_payment_method_specific_output.to_h unless @card_payment_method_specific_output.nil?
          hash['merchantParameters'] = @merchant_parameters unless @merchant_parameters.nil?
          hash['mobilePaymentMethodSpecificOutput'] = @mobile_payment_method_specific_output.to_h unless @mobile_payment_method_specific_output.nil?
          hash['operationReferences'] = @operation_references.to_h unless @operation_references.nil?
          hash['paymentMethod'] = @payment_method unless @payment_method.nil?
          hash['redirectPaymentMethodSpecificOutput'] = @redirect_payment_method_specific_output.to_h unless @redirect_payment_method_specific_output.nil?
          hash['references'] = @references.to_h unless @references.nil?
          hash['sepaDirectDebitPaymentMethodSpecificOutput'] = @sepa_direct_debit_payment_method_specific_output.to_h unless @sepa_direct_debit_payment_method_specific_output.nil?
          hash['surchargeSpecificOutput'] = @surcharge_specific_output.to_h unless @surcharge_specific_output.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'acquiredAmount'
            raise TypeError, "value '%s' is not a Hash" % [hash['acquiredAmount']] unless hash['acquiredAmount'].is_a? Hash
            @acquired_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['acquiredAmount'])
          end
          if hash.has_key? 'amountOfMoney'
            raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.has_key? 'amountPaid'
            @amount_paid = hash['amountPaid']
          end
          if hash.has_key? 'cardPaymentMethodSpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['cardPaymentMethodSpecificOutput']] unless hash['cardPaymentMethodSpecificOutput'].is_a? Hash
            @card_payment_method_specific_output = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificOutput.new_from_hash(hash['cardPaymentMethodSpecificOutput'])
          end
          if hash.has_key? 'merchantParameters'
            @merchant_parameters = hash['merchantParameters']
          end
          if hash.has_key? 'mobilePaymentMethodSpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['mobilePaymentMethodSpecificOutput']] unless hash['mobilePaymentMethodSpecificOutput'].is_a? Hash
            @mobile_payment_method_specific_output = OnlinePayments::SDK::Domain::MobilePaymentMethodSpecificOutput.new_from_hash(hash['mobilePaymentMethodSpecificOutput'])
          end
          if hash.has_key? 'operationReferences'
            raise TypeError, "value '%s' is not a Hash" % [hash['operationReferences']] unless hash['operationReferences'].is_a? Hash
            @operation_references = OnlinePayments::SDK::Domain::OperationPaymentReferences.new_from_hash(hash['operationReferences'])
          end
          if hash.has_key? 'paymentMethod'
            @payment_method = hash['paymentMethod']
          end
          if hash.has_key? 'redirectPaymentMethodSpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['redirectPaymentMethodSpecificOutput']] unless hash['redirectPaymentMethodSpecificOutput'].is_a? Hash
            @redirect_payment_method_specific_output = OnlinePayments::SDK::Domain::RedirectPaymentMethodSpecificOutput.new_from_hash(hash['redirectPaymentMethodSpecificOutput'])
          end
          if hash.has_key? 'references'
            raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
          end
          if hash.has_key? 'sepaDirectDebitPaymentMethodSpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['sepaDirectDebitPaymentMethodSpecificOutput']] unless hash['sepaDirectDebitPaymentMethodSpecificOutput'].is_a? Hash
            @sepa_direct_debit_payment_method_specific_output = OnlinePayments::SDK::Domain::SepaDirectDebitPaymentMethodSpecificOutput.new_from_hash(hash['sepaDirectDebitPaymentMethodSpecificOutput'])
          end
          if hash.has_key? 'surchargeSpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['surchargeSpecificOutput']] unless hash['surchargeSpecificOutput'].is_a? Hash
            @surcharge_specific_output = OnlinePayments::SDK::Domain::SurchargeSpecificOutput.new_from_hash(hash['surchargeSpecificOutput'])
          end
        end
      end
    end
  end
end
