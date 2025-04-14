#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/operation_payment_references'
require 'onlinepayments/sdk/domain/payment_references'
require 'onlinepayments/sdk/domain/refund_card_method_specific_output'
require 'onlinepayments/sdk/domain/refund_e_wallet_method_specific_output'
require 'onlinepayments/sdk/domain/refund_mobile_method_specific_output'
require 'onlinepayments/sdk/domain/refund_redirect_method_specific_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
      # @attr [Integer] amount_paid
      # @attr [OnlinePayments::SDK::Domain::RefundCardMethodSpecificOutput] card_refund_method_specific_output
      # @attr [OnlinePayments::SDK::Domain::RefundEWalletMethodSpecificOutput] e_wallet_refund_method_specific_output
      # @attr [String] merchant_parameters
      # @attr [OnlinePayments::SDK::Domain::RefundMobileMethodSpecificOutput] mobile_refund_method_specific_output
      # @attr [OnlinePayments::SDK::Domain::OperationPaymentReferences] operation_references
      # @attr [String] payment_method
      # @attr [OnlinePayments::SDK::Domain::RefundRedirectMethodSpecificOutput] redirect_refund_method_specific_output
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences] references
      class RefundOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :amount_paid

        attr_accessor :card_refund_method_specific_output

        attr_accessor :e_wallet_refund_method_specific_output

        attr_accessor :merchant_parameters

        attr_accessor :mobile_refund_method_specific_output

        attr_accessor :operation_references

        attr_accessor :payment_method

        attr_accessor :redirect_refund_method_specific_output

        attr_accessor :references

        # @return (Hash)
        def to_h
          hash = super
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['amountPaid'] = @amount_paid unless @amount_paid.nil?
          hash['cardRefundMethodSpecificOutput'] = @card_refund_method_specific_output.to_h unless @card_refund_method_specific_output.nil?
          hash['eWalletRefundMethodSpecificOutput'] = @e_wallet_refund_method_specific_output.to_h unless @e_wallet_refund_method_specific_output.nil?
          hash['merchantParameters'] = @merchant_parameters unless @merchant_parameters.nil?
          hash['mobileRefundMethodSpecificOutput'] = @mobile_refund_method_specific_output.to_h unless @mobile_refund_method_specific_output.nil?
          hash['operationReferences'] = @operation_references.to_h unless @operation_references.nil?
          hash['paymentMethod'] = @payment_method unless @payment_method.nil?
          hash['redirectRefundMethodSpecificOutput'] = @redirect_refund_method_specific_output.to_h unless @redirect_refund_method_specific_output.nil?
          hash['references'] = @references.to_h unless @references.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amountOfMoney'
            raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.has_key? 'amountPaid'
            @amount_paid = hash['amountPaid']
          end
          if hash.has_key? 'cardRefundMethodSpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['cardRefundMethodSpecificOutput']] unless hash['cardRefundMethodSpecificOutput'].is_a? Hash
            @card_refund_method_specific_output = OnlinePayments::SDK::Domain::RefundCardMethodSpecificOutput.new_from_hash(hash['cardRefundMethodSpecificOutput'])
          end
          if hash.has_key? 'eWalletRefundMethodSpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['eWalletRefundMethodSpecificOutput']] unless hash['eWalletRefundMethodSpecificOutput'].is_a? Hash
            @e_wallet_refund_method_specific_output = OnlinePayments::SDK::Domain::RefundEWalletMethodSpecificOutput.new_from_hash(hash['eWalletRefundMethodSpecificOutput'])
          end
          if hash.has_key? 'merchantParameters'
            @merchant_parameters = hash['merchantParameters']
          end
          if hash.has_key? 'mobileRefundMethodSpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['mobileRefundMethodSpecificOutput']] unless hash['mobileRefundMethodSpecificOutput'].is_a? Hash
            @mobile_refund_method_specific_output = OnlinePayments::SDK::Domain::RefundMobileMethodSpecificOutput.new_from_hash(hash['mobileRefundMethodSpecificOutput'])
          end
          if hash.has_key? 'operationReferences'
            raise TypeError, "value '%s' is not a Hash" % [hash['operationReferences']] unless hash['operationReferences'].is_a? Hash
            @operation_references = OnlinePayments::SDK::Domain::OperationPaymentReferences.new_from_hash(hash['operationReferences'])
          end
          if hash.has_key? 'paymentMethod'
            @payment_method = hash['paymentMethod']
          end
          if hash.has_key? 'redirectRefundMethodSpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['redirectRefundMethodSpecificOutput']] unless hash['redirectRefundMethodSpecificOutput'].is_a? Hash
            @redirect_refund_method_specific_output = OnlinePayments::SDK::Domain::RefundRedirectMethodSpecificOutput.new_from_hash(hash['redirectRefundMethodSpecificOutput'])
          end
          if hash.has_key? 'references'
            raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
          end
        end
      end
    end
  end
end
