#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/customer_bank_account'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/fraud_results'
require 'onlinepayments/sdk/domain/payment_product3203_specific_output'
require 'onlinepayments/sdk/domain/payment_product3204_specific_output'
require 'onlinepayments/sdk/domain/payment_product5001_specific_output'
require 'onlinepayments/sdk/domain/payment_product5402_specific_output'
require 'onlinepayments/sdk/domain/payment_product5500_specific_output'
require 'onlinepayments/sdk/domain/payment_product840_specific_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] authorisation_code
      # @attr [OnlinePayments::SDK::Domain::CustomerBankAccount] customer_bank_account
      # @attr [OnlinePayments::SDK::Domain::FraudResults] fraud_results
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct3204SpecificOutput] payment_method3204_specific_output
      # @attr [String] payment_option
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct3203SpecificOutput] payment_product3203_specific_output
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct5001SpecificOutput] payment_product5001_specific_output
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct5402SpecificOutput] payment_product5402_specific_output
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct5500SpecificOutput] payment_product5500_specific_output
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct840SpecificOutput] payment_product840_specific_output
      # @attr [Integer] payment_product_id
      # @attr [String] token
      class RedirectPaymentMethodSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :authorisation_code

        attr_accessor :customer_bank_account

        attr_accessor :fraud_results

        attr_accessor :payment_method3204_specific_output

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
          hash['customerBankAccount'] = @customer_bank_account.to_h unless @customer_bank_account.nil?
          hash['fraudResults'] = @fraud_results.to_h unless @fraud_results.nil?
          hash['paymentMethod3204SpecificOutput'] = @payment_method3204_specific_output.to_h unless @payment_method3204_specific_output.nil?
          hash['paymentOption'] = @payment_option unless @payment_option.nil?
          hash['paymentProduct3203SpecificOutput'] = @payment_product3203_specific_output.to_h unless @payment_product3203_specific_output.nil?
          hash['paymentProduct5001SpecificOutput'] = @payment_product5001_specific_output.to_h unless @payment_product5001_specific_output.nil?
          hash['paymentProduct5402SpecificOutput'] = @payment_product5402_specific_output.to_h unless @payment_product5402_specific_output.nil?
          hash['paymentProduct5500SpecificOutput'] = @payment_product5500_specific_output.to_h unless @payment_product5500_specific_output.nil?
          hash['paymentProduct840SpecificOutput'] = @payment_product840_specific_output.to_h unless @payment_product840_specific_output.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash['token'] = @token unless @token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'authorisationCode'
            @authorisation_code = hash['authorisationCode']
          end
          if hash.has_key? 'customerBankAccount'
            raise TypeError, "value '%s' is not a Hash" % [hash['customerBankAccount']] unless hash['customerBankAccount'].is_a? Hash
            @customer_bank_account = OnlinePayments::SDK::Domain::CustomerBankAccount.new_from_hash(hash['customerBankAccount'])
          end
          if hash.has_key? 'fraudResults'
            raise TypeError, "value '%s' is not a Hash" % [hash['fraudResults']] unless hash['fraudResults'].is_a? Hash
            @fraud_results = OnlinePayments::SDK::Domain::FraudResults.new_from_hash(hash['fraudResults'])
          end
          if hash.has_key? 'paymentMethod3204SpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentMethod3204SpecificOutput']] unless hash['paymentMethod3204SpecificOutput'].is_a? Hash
            @payment_method3204_specific_output = OnlinePayments::SDK::Domain::PaymentProduct3204SpecificOutput.new_from_hash(hash['paymentMethod3204SpecificOutput'])
          end
          if hash.has_key? 'paymentOption'
            @payment_option = hash['paymentOption']
          end
          if hash.has_key? 'paymentProduct3203SpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3203SpecificOutput']] unless hash['paymentProduct3203SpecificOutput'].is_a? Hash
            @payment_product3203_specific_output = OnlinePayments::SDK::Domain::PaymentProduct3203SpecificOutput.new_from_hash(hash['paymentProduct3203SpecificOutput'])
          end
          if hash.has_key? 'paymentProduct5001SpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5001SpecificOutput']] unless hash['paymentProduct5001SpecificOutput'].is_a? Hash
            @payment_product5001_specific_output = OnlinePayments::SDK::Domain::PaymentProduct5001SpecificOutput.new_from_hash(hash['paymentProduct5001SpecificOutput'])
          end
          if hash.has_key? 'paymentProduct5402SpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5402SpecificOutput']] unless hash['paymentProduct5402SpecificOutput'].is_a? Hash
            @payment_product5402_specific_output = OnlinePayments::SDK::Domain::PaymentProduct5402SpecificOutput.new_from_hash(hash['paymentProduct5402SpecificOutput'])
          end
          if hash.has_key? 'paymentProduct5500SpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5500SpecificOutput']] unless hash['paymentProduct5500SpecificOutput'].is_a? Hash
            @payment_product5500_specific_output = OnlinePayments::SDK::Domain::PaymentProduct5500SpecificOutput.new_from_hash(hash['paymentProduct5500SpecificOutput'])
          end
          if hash.has_key? 'paymentProduct840SpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct840SpecificOutput']] unless hash['paymentProduct840SpecificOutput'].is_a? Hash
            @payment_product840_specific_output = OnlinePayments::SDK::Domain::PaymentProduct840SpecificOutput.new_from_hash(hash['paymentProduct840SpecificOutput'])
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
          if hash.has_key? 'token'
            @token = hash['token']
          end
        end
      end
    end
  end
end
