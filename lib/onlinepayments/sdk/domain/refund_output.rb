#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/payment_references'
require 'onlinepayments/sdk/domain/refund_card_method_specific_output'
require 'onlinepayments/sdk/domain/refund_e_wallet_method_specific_output'
require 'onlinepayments/sdk/domain/refund_mobile_method_specific_output'
require 'onlinepayments/sdk/domain/refund_redirect_method_specific_output'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
    # @attr [Long] amount_paid
    # @attr [OnlinePayments::SDK::Domain::RefundCardMethodSpecificOutput] card_refund_method_specific_output
    # @attr [OnlinePayments::SDK::Domain::RefundEWalletMethodSpecificOutput] e_wallet_refund_method_specific_output
    # @attr [String] merchant_parameters
    # @attr [OnlinePayments::SDK::Domain::RefundMobileMethodSpecificOutput] mobile_refund_method_specific_output
    # @attr [String] payment_method
    # @attr [OnlinePayments::SDK::Domain::RefundRedirectMethodSpecificOutput] redirect_refund_method_specific_output
    # @attr [OnlinePayments::SDK::Domain::PaymentReferences] references
    class RefundOutput < OnlinePayments::SDK::DataObject
      attr_accessor :amount_of_money
      attr_accessor :amount_paid
      attr_accessor :card_refund_method_specific_output
      attr_accessor :e_wallet_refund_method_specific_output
      attr_accessor :merchant_parameters
      attr_accessor :mobile_refund_method_specific_output
      attr_accessor :payment_method
      attr_accessor :redirect_refund_method_specific_output
      attr_accessor :references

      # @return (Hash)
      def to_h
        hash = super
        hash['amountOfMoney'] = @amount_of_money.to_h if @amount_of_money
        hash['amountPaid'] = @amount_paid unless @amount_paid.nil?
        hash['cardRefundMethodSpecificOutput'] = @card_refund_method_specific_output.to_h if @card_refund_method_specific_output
        hash['eWalletRefundMethodSpecificOutput'] = @e_wallet_refund_method_specific_output.to_h if @e_wallet_refund_method_specific_output
        hash['merchantParameters'] = @merchant_parameters unless @merchant_parameters.nil?
        hash['mobileRefundMethodSpecificOutput'] = @mobile_refund_method_specific_output.to_h if @mobile_refund_method_specific_output
        hash['paymentMethod'] = @payment_method unless @payment_method.nil?
        hash['redirectRefundMethodSpecificOutput'] = @redirect_refund_method_specific_output.to_h if @redirect_refund_method_specific_output
        hash['references'] = @references.to_h if @references
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'amountOfMoney'
          raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
          @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        @amount_paid = hash['amountPaid'] if hash.key? 'amountPaid'
        if hash.key? 'cardRefundMethodSpecificOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['cardRefundMethodSpecificOutput']] unless hash['cardRefundMethodSpecificOutput'].is_a? Hash
          @card_refund_method_specific_output = OnlinePayments::SDK::Domain::RefundCardMethodSpecificOutput.new_from_hash(hash['cardRefundMethodSpecificOutput'])
        end
        if hash.key? 'eWalletRefundMethodSpecificOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['eWalletRefundMethodSpecificOutput']] unless hash['eWalletRefundMethodSpecificOutput'].is_a? Hash
          @e_wallet_refund_method_specific_output = OnlinePayments::SDK::Domain::RefundEWalletMethodSpecificOutput.new_from_hash(hash['eWalletRefundMethodSpecificOutput'])
        end
        @merchant_parameters = hash['merchantParameters'] if hash.key? 'merchantParameters'
        if hash.key? 'mobileRefundMethodSpecificOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['mobileRefundMethodSpecificOutput']] unless hash['mobileRefundMethodSpecificOutput'].is_a? Hash
          @mobile_refund_method_specific_output = OnlinePayments::SDK::Domain::RefundMobileMethodSpecificOutput.new_from_hash(hash['mobileRefundMethodSpecificOutput'])
        end
        @payment_method = hash['paymentMethod'] if hash.key? 'paymentMethod'
        if hash.key? 'redirectRefundMethodSpecificOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['redirectRefundMethodSpecificOutput']] unless hash['redirectRefundMethodSpecificOutput'].is_a? Hash
          @redirect_refund_method_specific_output = OnlinePayments::SDK::Domain::RefundRedirectMethodSpecificOutput.new_from_hash(hash['redirectRefundMethodSpecificOutput'])
        end
        if hash.key? 'references'
          raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
          @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
        end
      end
    end
  end
end
