#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/acquirer_information'
require 'onlinepayments/sdk/domain/card_essentials'
require 'onlinepayments/sdk/domain/card_fraud_results'
require 'onlinepayments/sdk/domain/currency_conversion'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/external_token_linked'
require 'onlinepayments/sdk/domain/payment_product3208_specific_output'
require 'onlinepayments/sdk/domain/payment_product3209_specific_output'
require 'onlinepayments/sdk/domain/reattempt_instructions'
require 'onlinepayments/sdk/domain/three_d_secure_results'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AcquirerInformation] acquirer_information
      # @attr [Integer] authenticated_amount
      # @attr [String] authorisation_code
      # @attr [OnlinePayments::SDK::Domain::CardEssentials] card
      # @attr [OnlinePayments::SDK::Domain::CurrencyConversion] currency_conversion
      # @attr [OnlinePayments::SDK::Domain::ExternalTokenLinked] external_token_linked
      # @attr [OnlinePayments::SDK::Domain::CardFraudResults] fraud_results
      # @attr [String] initial_scheme_transaction_id
      # @attr [String] payment_account_reference
      # @attr [String] payment_option
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct3208SpecificOutput] payment_product3208_specific_output
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct3209SpecificOutput] payment_product3209_specific_output
      # @attr [Integer] payment_product_id
      # @attr [OnlinePayments::SDK::Domain::ReattemptInstructions] reattempt_instructions
      # @attr [String] scheme_reference_data
      # @attr [OnlinePayments::SDK::Domain::ThreeDSecureResults] three_d_secure_results
      # @attr [String] token
      class CardPaymentMethodSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acquirer_information

        attr_accessor :authenticated_amount

        attr_accessor :authorisation_code

        attr_accessor :card

        attr_accessor :currency_conversion

        attr_accessor :external_token_linked

        attr_accessor :fraud_results

        attr_accessor :initial_scheme_transaction_id

        attr_accessor :payment_account_reference

        attr_accessor :payment_option

        attr_accessor :payment_product3208_specific_output

        attr_accessor :payment_product3209_specific_output

        attr_accessor :payment_product_id

        attr_accessor :reattempt_instructions

        attr_accessor :scheme_reference_data

        attr_accessor :three_d_secure_results

        attr_accessor :token

        # @return (Hash)
        def to_h
          hash = super
          hash['acquirerInformation'] = @acquirer_information.to_h unless @acquirer_information.nil?
          hash['authenticatedAmount'] = @authenticated_amount unless @authenticated_amount.nil?
          hash['authorisationCode'] = @authorisation_code unless @authorisation_code.nil?
          hash['card'] = @card.to_h unless @card.nil?
          hash['currencyConversion'] = @currency_conversion.to_h unless @currency_conversion.nil?
          hash['externalTokenLinked'] = @external_token_linked.to_h unless @external_token_linked.nil?
          hash['fraudResults'] = @fraud_results.to_h unless @fraud_results.nil?
          hash['initialSchemeTransactionId'] = @initial_scheme_transaction_id unless @initial_scheme_transaction_id.nil?
          hash['paymentAccountReference'] = @payment_account_reference unless @payment_account_reference.nil?
          hash['paymentOption'] = @payment_option unless @payment_option.nil?
          hash['paymentProduct3208SpecificOutput'] = @payment_product3208_specific_output.to_h unless @payment_product3208_specific_output.nil?
          hash['paymentProduct3209SpecificOutput'] = @payment_product3209_specific_output.to_h unless @payment_product3209_specific_output.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash['reattemptInstructions'] = @reattempt_instructions.to_h unless @reattempt_instructions.nil?
          hash['schemeReferenceData'] = @scheme_reference_data unless @scheme_reference_data.nil?
          hash['threeDSecureResults'] = @three_d_secure_results.to_h unless @three_d_secure_results.nil?
          hash['token'] = @token unless @token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'acquirerInformation'
            raise TypeError, "value '%s' is not a Hash" % [hash['acquirerInformation']] unless hash['acquirerInformation'].is_a? Hash
            @acquirer_information = OnlinePayments::SDK::Domain::AcquirerInformation.new_from_hash(hash['acquirerInformation'])
          end
          if hash.has_key? 'authenticatedAmount'
            @authenticated_amount = hash['authenticatedAmount']
          end
          if hash.has_key? 'authorisationCode'
            @authorisation_code = hash['authorisationCode']
          end
          if hash.has_key? 'card'
            raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::CardEssentials.new_from_hash(hash['card'])
          end
          if hash.has_key? 'currencyConversion'
            raise TypeError, "value '%s' is not a Hash" % [hash['currencyConversion']] unless hash['currencyConversion'].is_a? Hash
            @currency_conversion = OnlinePayments::SDK::Domain::CurrencyConversion.new_from_hash(hash['currencyConversion'])
          end
          if hash.has_key? 'externalTokenLinked'
            raise TypeError, "value '%s' is not a Hash" % [hash['externalTokenLinked']] unless hash['externalTokenLinked'].is_a? Hash
            @external_token_linked = OnlinePayments::SDK::Domain::ExternalTokenLinked.new_from_hash(hash['externalTokenLinked'])
          end
          if hash.has_key? 'fraudResults'
            raise TypeError, "value '%s' is not a Hash" % [hash['fraudResults']] unless hash['fraudResults'].is_a? Hash
            @fraud_results = OnlinePayments::SDK::Domain::CardFraudResults.new_from_hash(hash['fraudResults'])
          end
          if hash.has_key? 'initialSchemeTransactionId'
            @initial_scheme_transaction_id = hash['initialSchemeTransactionId']
          end
          if hash.has_key? 'paymentAccountReference'
            @payment_account_reference = hash['paymentAccountReference']
          end
          if hash.has_key? 'paymentOption'
            @payment_option = hash['paymentOption']
          end
          if hash.has_key? 'paymentProduct3208SpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3208SpecificOutput']] unless hash['paymentProduct3208SpecificOutput'].is_a? Hash
            @payment_product3208_specific_output = OnlinePayments::SDK::Domain::PaymentProduct3208SpecificOutput.new_from_hash(hash['paymentProduct3208SpecificOutput'])
          end
          if hash.has_key? 'paymentProduct3209SpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3209SpecificOutput']] unless hash['paymentProduct3209SpecificOutput'].is_a? Hash
            @payment_product3209_specific_output = OnlinePayments::SDK::Domain::PaymentProduct3209SpecificOutput.new_from_hash(hash['paymentProduct3209SpecificOutput'])
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
          if hash.has_key? 'reattemptInstructions'
            raise TypeError, "value '%s' is not a Hash" % [hash['reattemptInstructions']] unless hash['reattemptInstructions'].is_a? Hash
            @reattempt_instructions = OnlinePayments::SDK::Domain::ReattemptInstructions.new_from_hash(hash['reattemptInstructions'])
          end
          if hash.has_key? 'schemeReferenceData'
            @scheme_reference_data = hash['schemeReferenceData']
          end
          if hash.has_key? 'threeDSecureResults'
            raise TypeError, "value '%s' is not a Hash" % [hash['threeDSecureResults']] unless hash['threeDSecureResults'].is_a? Hash
            @three_d_secure_results = OnlinePayments::SDK::Domain::ThreeDSecureResults.new_from_hash(hash['threeDSecureResults'])
          end
          if hash.has_key? 'token'
            @token = hash['token']
          end
        end
      end
    end
  end
end
