#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card'
require 'onlinepayments/sdk/domain/card_recurrence_details'
require 'onlinepayments/sdk/domain/currency_conversion_input'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/multiple_payment_information'
require 'onlinepayments/sdk/domain/payment_product130_specific_input'
require 'onlinepayments/sdk/domain/payment_product3012_specific_input'
require 'onlinepayments/sdk/domain/payment_product3208_specific_input'
require 'onlinepayments/sdk/domain/payment_product3209_specific_input'
require 'onlinepayments/sdk/domain/three_d_secure'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] allow_dynamic_linking
      # @attr [String] authorization_mode
      # @attr [OnlinePayments::SDK::Domain::Card] card
      # @attr [String] card_on_file_recurring_expiration
      # @attr [String] card_on_file_recurring_frequency
      # @attr [String] cobrand_selection_indicator
      # @attr [OnlinePayments::SDK::Domain::CurrencyConversionInput] currency_conversion
      # @attr [String] initial_scheme_transaction_id
      # @attr [true/false] is_recurring
      # @attr [OnlinePayments::SDK::Domain::MultiplePaymentInformation] multiple_payment_information
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct130SpecificInput] payment_product130_specific_input
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct3012SpecificInput] payment_product3012_specific_input
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct3208SpecificInput] payment_product3208_specific_input
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct3209SpecificInput] payment_product3209_specific_input
      # @attr [Integer] payment_product_id
      # @attr [OnlinePayments::SDK::Domain::CardRecurrenceDetails] recurring
      # @attr [String] return_url
      # @attr [String] scheme_reference_data
      # @attr [true/false] skip_authentication
      # @attr [OnlinePayments::SDK::Domain::ThreeDSecure] three_d_secure
      # @attr [String] token
      # @attr [true/false] tokenize
      # @attr [String] transaction_channel
      # @attr [String] unscheduled_card_on_file_requestor
      # @attr [String] unscheduled_card_on_file_sequence_indicator
      class CardPaymentMethodSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :allow_dynamic_linking

        attr_accessor :authorization_mode

        attr_accessor :card

        attr_accessor :card_on_file_recurring_expiration

        attr_accessor :card_on_file_recurring_frequency

        attr_accessor :cobrand_selection_indicator

        attr_accessor :currency_conversion

        attr_accessor :initial_scheme_transaction_id

        attr_accessor :is_recurring

        attr_accessor :multiple_payment_information

        attr_accessor :payment_product130_specific_input

        attr_accessor :payment_product3012_specific_input

        attr_accessor :payment_product3208_specific_input

        attr_accessor :payment_product3209_specific_input

        attr_accessor :payment_product_id

        attr_accessor :recurring

        attr_accessor :return_url

        attr_accessor :scheme_reference_data

        # @deprecated Use threeDSecure.skipAuthentication instead.  * true = 3D Secure authentication will be skipped for this transaction. This setting should be used when isRecurring is set to true and recurringPaymentSequenceIndicator is set to recurring.  * false = 3D Secure authentication will not be skipped for this transaction.    Note: This is only possible if your account in our system is setup for 3D Secure authentication and if your configuration in our system allows you to override it per transaction.
        attr_accessor :skip_authentication

        attr_accessor :three_d_secure

        attr_accessor :token

        attr_accessor :tokenize

        attr_accessor :transaction_channel

        attr_accessor :unscheduled_card_on_file_requestor

        attr_accessor :unscheduled_card_on_file_sequence_indicator

        # @return (Hash)
        def to_h
          hash = super
          hash['allowDynamicLinking'] = @allow_dynamic_linking unless @allow_dynamic_linking.nil?
          hash['authorizationMode'] = @authorization_mode unless @authorization_mode.nil?
          hash['card'] = @card.to_h unless @card.nil?
          hash['cardOnFileRecurringExpiration'] = @card_on_file_recurring_expiration unless @card_on_file_recurring_expiration.nil?
          hash['cardOnFileRecurringFrequency'] = @card_on_file_recurring_frequency unless @card_on_file_recurring_frequency.nil?
          hash['cobrandSelectionIndicator'] = @cobrand_selection_indicator unless @cobrand_selection_indicator.nil?
          hash['currencyConversion'] = @currency_conversion.to_h unless @currency_conversion.nil?
          hash['initialSchemeTransactionId'] = @initial_scheme_transaction_id unless @initial_scheme_transaction_id.nil?
          hash['isRecurring'] = @is_recurring unless @is_recurring.nil?
          hash['multiplePaymentInformation'] = @multiple_payment_information.to_h unless @multiple_payment_information.nil?
          hash['paymentProduct130SpecificInput'] = @payment_product130_specific_input.to_h unless @payment_product130_specific_input.nil?
          hash['paymentProduct3012SpecificInput'] = @payment_product3012_specific_input.to_h unless @payment_product3012_specific_input.nil?
          hash['paymentProduct3208SpecificInput'] = @payment_product3208_specific_input.to_h unless @payment_product3208_specific_input.nil?
          hash['paymentProduct3209SpecificInput'] = @payment_product3209_specific_input.to_h unless @payment_product3209_specific_input.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash['recurring'] = @recurring.to_h unless @recurring.nil?
          hash['returnUrl'] = @return_url unless @return_url.nil?
          hash['schemeReferenceData'] = @scheme_reference_data unless @scheme_reference_data.nil?
          hash['skipAuthentication'] = @skip_authentication unless @skip_authentication.nil?
          hash['threeDSecure'] = @three_d_secure.to_h unless @three_d_secure.nil?
          hash['token'] = @token unless @token.nil?
          hash['tokenize'] = @tokenize unless @tokenize.nil?
          hash['transactionChannel'] = @transaction_channel unless @transaction_channel.nil?
          hash['unscheduledCardOnFileRequestor'] = @unscheduled_card_on_file_requestor unless @unscheduled_card_on_file_requestor.nil?
          hash['unscheduledCardOnFileSequenceIndicator'] = @unscheduled_card_on_file_sequence_indicator unless @unscheduled_card_on_file_sequence_indicator.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'allowDynamicLinking'
            @allow_dynamic_linking = hash['allowDynamicLinking']
          end
          if hash.has_key? 'authorizationMode'
            @authorization_mode = hash['authorizationMode']
          end
          if hash.has_key? 'card'
            raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::Card.new_from_hash(hash['card'])
          end
          if hash.has_key? 'cardOnFileRecurringExpiration'
            @card_on_file_recurring_expiration = hash['cardOnFileRecurringExpiration']
          end
          if hash.has_key? 'cardOnFileRecurringFrequency'
            @card_on_file_recurring_frequency = hash['cardOnFileRecurringFrequency']
          end
          if hash.has_key? 'cobrandSelectionIndicator'
            @cobrand_selection_indicator = hash['cobrandSelectionIndicator']
          end
          if hash.has_key? 'currencyConversion'
            raise TypeError, "value '%s' is not a Hash" % [hash['currencyConversion']] unless hash['currencyConversion'].is_a? Hash
            @currency_conversion = OnlinePayments::SDK::Domain::CurrencyConversionInput.new_from_hash(hash['currencyConversion'])
          end
          if hash.has_key? 'initialSchemeTransactionId'
            @initial_scheme_transaction_id = hash['initialSchemeTransactionId']
          end
          if hash.has_key? 'isRecurring'
            @is_recurring = hash['isRecurring']
          end
          if hash.has_key? 'multiplePaymentInformation'
            raise TypeError, "value '%s' is not a Hash" % [hash['multiplePaymentInformation']] unless hash['multiplePaymentInformation'].is_a? Hash
            @multiple_payment_information = OnlinePayments::SDK::Domain::MultiplePaymentInformation.new_from_hash(hash['multiplePaymentInformation'])
          end
          if hash.has_key? 'paymentProduct130SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct130SpecificInput']] unless hash['paymentProduct130SpecificInput'].is_a? Hash
            @payment_product130_specific_input = OnlinePayments::SDK::Domain::PaymentProduct130SpecificInput.new_from_hash(hash['paymentProduct130SpecificInput'])
          end
          if hash.has_key? 'paymentProduct3012SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3012SpecificInput']] unless hash['paymentProduct3012SpecificInput'].is_a? Hash
            @payment_product3012_specific_input = OnlinePayments::SDK::Domain::PaymentProduct3012SpecificInput.new_from_hash(hash['paymentProduct3012SpecificInput'])
          end
          if hash.has_key? 'paymentProduct3208SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3208SpecificInput']] unless hash['paymentProduct3208SpecificInput'].is_a? Hash
            @payment_product3208_specific_input = OnlinePayments::SDK::Domain::PaymentProduct3208SpecificInput.new_from_hash(hash['paymentProduct3208SpecificInput'])
          end
          if hash.has_key? 'paymentProduct3209SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3209SpecificInput']] unless hash['paymentProduct3209SpecificInput'].is_a? Hash
            @payment_product3209_specific_input = OnlinePayments::SDK::Domain::PaymentProduct3209SpecificInput.new_from_hash(hash['paymentProduct3209SpecificInput'])
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
          if hash.has_key? 'recurring'
            raise TypeError, "value '%s' is not a Hash" % [hash['recurring']] unless hash['recurring'].is_a? Hash
            @recurring = OnlinePayments::SDK::Domain::CardRecurrenceDetails.new_from_hash(hash['recurring'])
          end
          if hash.has_key? 'returnUrl'
            @return_url = hash['returnUrl']
          end
          if hash.has_key? 'schemeReferenceData'
            @scheme_reference_data = hash['schemeReferenceData']
          end
          if hash.has_key? 'skipAuthentication'
            @skip_authentication = hash['skipAuthentication']
          end
          if hash.has_key? 'threeDSecure'
            raise TypeError, "value '%s' is not a Hash" % [hash['threeDSecure']] unless hash['threeDSecure'].is_a? Hash
            @three_d_secure = OnlinePayments::SDK::Domain::ThreeDSecure.new_from_hash(hash['threeDSecure'])
          end
          if hash.has_key? 'token'
            @token = hash['token']
          end
          if hash.has_key? 'tokenize'
            @tokenize = hash['tokenize']
          end
          if hash.has_key? 'transactionChannel'
            @transaction_channel = hash['transactionChannel']
          end
          if hash.has_key? 'unscheduledCardOnFileRequestor'
            @unscheduled_card_on_file_requestor = hash['unscheduledCardOnFileRequestor']
          end
          if hash.has_key? 'unscheduledCardOnFileSequenceIndicator'
            @unscheduled_card_on_file_sequence_indicator = hash['unscheduledCardOnFileSequenceIndicator']
          end
        end
      end
    end
  end
end
