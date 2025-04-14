#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/credit_card_specific_input_hosted_tokenization'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_filters_hosted_tokenization'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] ask_consumer_consent
      # @attr [OnlinePayments::SDK::Domain::CreditCardSpecificInputHostedTokenization] credit_card_specific_input
      # @attr [String] locale
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFiltersHostedTokenization] payment_product_filters
      # @attr [String] tokens
      # @attr [String] variant
      class CreateHostedTokenizationRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :ask_consumer_consent

        attr_accessor :credit_card_specific_input

        attr_accessor :locale

        attr_accessor :payment_product_filters

        attr_accessor :tokens

        attr_accessor :variant

        # @return (Hash)
        def to_h
          hash = super
          hash['askConsumerConsent'] = @ask_consumer_consent unless @ask_consumer_consent.nil?
          hash['creditCardSpecificInput'] = @credit_card_specific_input.to_h unless @credit_card_specific_input.nil?
          hash['locale'] = @locale unless @locale.nil?
          hash['paymentProductFilters'] = @payment_product_filters.to_h unless @payment_product_filters.nil?
          hash['tokens'] = @tokens unless @tokens.nil?
          hash['variant'] = @variant unless @variant.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'askConsumerConsent'
            @ask_consumer_consent = hash['askConsumerConsent']
          end
          if hash.has_key? 'creditCardSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['creditCardSpecificInput']] unless hash['creditCardSpecificInput'].is_a? Hash
            @credit_card_specific_input = OnlinePayments::SDK::Domain::CreditCardSpecificInputHostedTokenization.new_from_hash(hash['creditCardSpecificInput'])
          end
          if hash.has_key? 'locale'
            @locale = hash['locale']
          end
          if hash.has_key? 'paymentProductFilters'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProductFilters']] unless hash['paymentProductFilters'].is_a? Hash
            @payment_product_filters = OnlinePayments::SDK::Domain::PaymentProductFiltersHostedTokenization.new_from_hash(hash['paymentProductFilters'])
          end
          if hash.has_key? 'tokens'
            @tokens = hash['tokens']
          end
          if hash.has_key? 'variant'
            @variant = hash['variant']
          end
        end
      end
    end
  end
end
