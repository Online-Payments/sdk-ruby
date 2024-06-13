#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/acquirer_information'
require 'onlinepayments/sdk/domain/card_essentials'
require 'onlinepayments/sdk/domain/card_fraud_results'
require 'onlinepayments/sdk/domain/currency_conversion'
require 'onlinepayments/sdk/domain/external_token_linked'
require 'onlinepayments/sdk/domain/network_token_essentials'
require 'onlinepayments/sdk/domain/payment_product3208_specific_output'
require 'onlinepayments/sdk/domain/payment_product3209_specific_output'
require 'onlinepayments/sdk/domain/three_d_secure_results'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AcquirerInformation] acquirer_information
    # @attr [Long] authenticated_amount
    # @attr [String] authorisation_code
    # @attr [OnlinePayments::SDK::Domain::CardEssentials] card
    # @attr [OnlinePayments::SDK::Domain::CurrencyConversion] currency_conversion
    # @attr [OnlinePayments::SDK::Domain::ExternalTokenLinked] external_token_linked
    # @attr [OnlinePayments::SDK::Domain::CardFraudResults] fraud_results
    # @attr [String] initial_scheme_transaction_id
    # @attr [OnlinePayments::SDK::Domain::NetworkTokenEssentials] network_token_data
    # @attr [String] payment_account_reference
    # @attr [String] payment_option
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct3208SpecificOutput] payment_product3208_specific_output
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct3209SpecificOutput] payment_product3209_specific_output
    # @attr [Integer] payment_product_id
    # @attr [String] scheme_reference_data
    # @attr [OnlinePayments::SDK::Domain::ThreeDSecureResults] three_d_secure_results
    # @attr [String] token
    class CardPaymentMethodSpecificOutput < OnlinePayments::SDK::DataObject
      attr_accessor :acquirer_information
      attr_accessor :authenticated_amount
      attr_accessor :authorisation_code
      attr_accessor :card
      attr_accessor :currency_conversion
      attr_accessor :external_token_linked
      attr_accessor :fraud_results
      attr_accessor :initial_scheme_transaction_id
      attr_accessor :network_token_data
      attr_accessor :payment_account_reference
      attr_accessor :payment_option
      attr_accessor :payment_product3208_specific_output
      attr_accessor :payment_product3209_specific_output
      attr_accessor :payment_product_id
      attr_accessor :scheme_reference_data
      attr_accessor :three_d_secure_results
      attr_accessor :token

      # @return (Hash)
      def to_h
        hash = super
        hash['acquirerInformation'] = @acquirer_information.to_h if @acquirer_information
        hash['authenticatedAmount'] = @authenticated_amount unless @authenticated_amount.nil?
        hash['authorisationCode'] = @authorisation_code unless @authorisation_code.nil?
        hash['card'] = @card.to_h if @card
        hash['currencyConversion'] = @currency_conversion.to_h if @currency_conversion
        hash['externalTokenLinked'] = @external_token_linked.to_h if @external_token_linked
        hash['fraudResults'] = @fraud_results.to_h if @fraud_results
        hash['initialSchemeTransactionId'] = @initial_scheme_transaction_id unless @initial_scheme_transaction_id.nil?
        hash['networkTokenData'] = @network_token_data.to_h if @network_token_data
        hash['paymentAccountReference'] = @payment_account_reference unless @payment_account_reference.nil?
        hash['paymentOption'] = @payment_option unless @payment_option.nil?
        hash['paymentProduct3208SpecificOutput'] = @payment_product3208_specific_output.to_h if @payment_product3208_specific_output
        hash['paymentProduct3209SpecificOutput'] = @payment_product3209_specific_output.to_h if @payment_product3209_specific_output
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['schemeReferenceData'] = @scheme_reference_data unless @scheme_reference_data.nil?
        hash['threeDSecureResults'] = @three_d_secure_results.to_h if @three_d_secure_results
        hash['token'] = @token unless @token.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'acquirerInformation'
          raise TypeError, "value '%s' is not a Hash" % [hash['acquirerInformation']] unless hash['acquirerInformation'].is_a? Hash
          @acquirer_information = OnlinePayments::SDK::Domain::AcquirerInformation.new_from_hash(hash['acquirerInformation'])
        end
        @authenticated_amount = hash['authenticatedAmount'] if hash.key? 'authenticatedAmount'
        @authorisation_code = hash['authorisationCode'] if hash.key? 'authorisationCode'
        if hash.key? 'card'
          raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
          @card = OnlinePayments::SDK::Domain::CardEssentials.new_from_hash(hash['card'])
        end
        if hash.key? 'currencyConversion'
          raise TypeError, "value '%s' is not a Hash" % [hash['currencyConversion']] unless hash['currencyConversion'].is_a? Hash
          @currency_conversion = OnlinePayments::SDK::Domain::CurrencyConversion.new_from_hash(hash['currencyConversion'])
        end
        if hash.key? 'externalTokenLinked'
          raise TypeError, "value '%s' is not a Hash" % [hash['externalTokenLinked']] unless hash['externalTokenLinked'].is_a? Hash
          @external_token_linked = OnlinePayments::SDK::Domain::ExternalTokenLinked.new_from_hash(hash['externalTokenLinked'])
        end
        if hash.key? 'fraudResults'
          raise TypeError, "value '%s' is not a Hash" % [hash['fraudResults']] unless hash['fraudResults'].is_a? Hash
          @fraud_results = OnlinePayments::SDK::Domain::CardFraudResults.new_from_hash(hash['fraudResults'])
        end
        @initial_scheme_transaction_id = hash['initialSchemeTransactionId'] if hash.key? 'initialSchemeTransactionId'
        if hash.key? 'networkTokenData'
          raise TypeError, "value '%s' is not a Hash" % [hash['networkTokenData']] unless hash['networkTokenData'].is_a? Hash
          @network_token_data = OnlinePayments::SDK::Domain::NetworkTokenEssentials.new_from_hash(hash['networkTokenData'])
        end
        @payment_account_reference = hash['paymentAccountReference'] if hash.key? 'paymentAccountReference'
        @payment_option = hash['paymentOption'] if hash.key? 'paymentOption'
        if hash.key? 'paymentProduct3208SpecificOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3208SpecificOutput']] unless hash['paymentProduct3208SpecificOutput'].is_a? Hash
          @payment_product3208_specific_output = OnlinePayments::SDK::Domain::PaymentProduct3208SpecificOutput.new_from_hash(hash['paymentProduct3208SpecificOutput'])
        end
        if hash.key? 'paymentProduct3209SpecificOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3209SpecificOutput']] unless hash['paymentProduct3209SpecificOutput'].is_a? Hash
          @payment_product3209_specific_output = OnlinePayments::SDK::Domain::PaymentProduct3209SpecificOutput.new_from_hash(hash['paymentProduct3209SpecificOutput'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        @scheme_reference_data = hash['schemeReferenceData'] if hash.key? 'schemeReferenceData'
        if hash.key? 'threeDSecureResults'
          raise TypeError, "value '%s' is not a Hash" % [hash['threeDSecureResults']] unless hash['threeDSecureResults'].is_a? Hash
          @three_d_secure_results = OnlinePayments::SDK::Domain::ThreeDSecureResults.new_from_hash(hash['threeDSecureResults'])
        end
        @token = hash['token'] if hash.key? 'token'
      end
    end
  end
end
