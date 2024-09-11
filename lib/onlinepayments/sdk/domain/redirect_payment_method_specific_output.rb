#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/customer_bank_account'
require 'onlinepayments/sdk/domain/fraud_results'
require 'onlinepayments/sdk/domain/payment_product3203_specific_output'
require 'onlinepayments/sdk/domain/payment_product5001_specific_output'
require 'onlinepayments/sdk/domain/payment_product5402_specific_output'
require 'onlinepayments/sdk/domain/payment_product5500_specific_output'
require 'onlinepayments/sdk/domain/payment_product840_specific_output'

module OnlinePayments::SDK
  module Domain

    # @attr [String] authorisation_code
    # @attr [OnlinePayments::SDK::Domain::CustomerBankAccount] customer_bank_account
    # @attr [OnlinePayments::SDK::Domain::FraudResults] fraud_results
    # @attr [String] payment_option
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct3203SpecificOutput] payment_product3203_specific_output
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct5001SpecificOutput] payment_product5001_specific_output
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct5402SpecificOutput] payment_product5402_specific_output
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct5500SpecificOutput] payment_product5500_specific_output
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct840SpecificOutput] payment_product840_specific_output
    # @attr [Integer] payment_product_id
    # @attr [String] token
    class RedirectPaymentMethodSpecificOutput < OnlinePayments::SDK::DataObject
      attr_accessor :authorisation_code
      attr_accessor :customer_bank_account
      attr_accessor :fraud_results
      attr_accessor :payment_option
      attr_accessor :payment_product3203_specific_output
      attr_accessor :payment_product5001_specific_output
      attr_accessor :payment_product5402_specific_output
      attr_accessor :payment_product5500_specific_output
      attr_accessor :payment_product840_specific_output
      attr_accessor :payment_product_id
      attr_accessor :token

      # @return (Hash)
      def to_h
        hash = super
        hash['authorisationCode'] = @authorisation_code unless @authorisation_code.nil?
        hash['customerBankAccount'] = @customer_bank_account.to_h if @customer_bank_account
        hash['fraudResults'] = @fraud_results.to_h if @fraud_results
        hash['paymentOption'] = @payment_option unless @payment_option.nil?
        hash['paymentProduct3203SpecificOutput'] = @payment_product3203_specific_output.to_h if @payment_product3203_specific_output
        hash['paymentProduct5001SpecificOutput'] = @payment_product5001_specific_output.to_h if @payment_product5001_specific_output
        hash['paymentProduct5402SpecificOutput'] = @payment_product5402_specific_output.to_h if @payment_product5402_specific_output
        hash['paymentProduct5500SpecificOutput'] = @payment_product5500_specific_output.to_h if @payment_product5500_specific_output
        hash['paymentProduct840SpecificOutput'] = @payment_product840_specific_output.to_h if @payment_product840_specific_output
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['token'] = @token unless @token.nil?
        hash
      end

      def from_hash(hash)
        super
        @authorisation_code = hash['authorisationCode'] if hash.key? 'authorisationCode'
        if hash.key? 'customerBankAccount'
          raise TypeError, "value '%s' is not a Hash" % [hash['customerBankAccount']] unless hash['customerBankAccount'].is_a? Hash
          @customer_bank_account = OnlinePayments::SDK::Domain::CustomerBankAccount.new_from_hash(hash['customerBankAccount'])
        end
        if hash.key? 'fraudResults'
          raise TypeError, "value '%s' is not a Hash" % [hash['fraudResults']] unless hash['fraudResults'].is_a? Hash
          @fraud_results = OnlinePayments::SDK::Domain::FraudResults.new_from_hash(hash['fraudResults'])
        end
        @payment_option = hash['paymentOption'] if hash.key? 'paymentOption'
        if hash.key? 'paymentProduct3203SpecificOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3203SpecificOutput']] unless hash['paymentProduct3203SpecificOutput'].is_a? Hash
          @payment_product3203_specific_output = OnlinePayments::SDK::Domain::PaymentProduct3203SpecificOutput.new_from_hash(hash['paymentProduct3203SpecificOutput'])
        end
        if hash.key? 'paymentProduct5001SpecificOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5001SpecificOutput']] unless hash['paymentProduct5001SpecificOutput'].is_a? Hash
          @payment_product5001_specific_output = OnlinePayments::SDK::Domain::PaymentProduct5001SpecificOutput.new_from_hash(hash['paymentProduct5001SpecificOutput'])
        end
        if hash.key? 'paymentProduct5402SpecificOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5402SpecificOutput']] unless hash['paymentProduct5402SpecificOutput'].is_a? Hash
          @payment_product5402_specific_output = OnlinePayments::SDK::Domain::PaymentProduct5402SpecificOutput.new_from_hash(hash['paymentProduct5402SpecificOutput'])
        end
        if hash.key? 'paymentProduct5500SpecificOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5500SpecificOutput']] unless hash['paymentProduct5500SpecificOutput'].is_a? Hash
          @payment_product5500_specific_output = OnlinePayments::SDK::Domain::PaymentProduct5500SpecificOutput.new_from_hash(hash['paymentProduct5500SpecificOutput'])
        end
        if hash.key? 'paymentProduct840SpecificOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct840SpecificOutput']] unless hash['paymentProduct840SpecificOutput'].is_a? Hash
          @payment_product840_specific_output = OnlinePayments::SDK::Domain::PaymentProduct840SpecificOutput.new_from_hash(hash['paymentProduct840SpecificOutput'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        @token = hash['token'] if hash.key? 'token'
      end
    end
  end
end
