# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/credit_card_specific_input_hosted_tokenization'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_filters_hosted_tokenization'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] ask_consumer_consent
      # @attr [OnlinePayments::SDK::Domain::CreditCardSpecificInputHostedTokenization, nil] credit_card_specific_input
      # @attr [String, nil] locale
      # @attr [String, nil] origin
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFiltersHostedTokenization, nil] payment_product_filters
      # @attr [String, nil] tokens
      # @attr [String, nil] variant
      class CreateHostedTokenizationRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :ask_consumer_consent

        attr_accessor :credit_card_specific_input

        attr_accessor :locale

        attr_accessor :origin

        attr_accessor :payment_product_filters

        attr_accessor :tokens

        attr_accessor :variant

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(ask_consumer_consent: nil, credit_card_specific_input: nil, locale: nil, origin: nil, payment_product_filters: nil, tokens: nil, variant: nil)
          super()
          @ask_consumer_consent = ask_consumer_consent
          @credit_card_specific_input = credit_card_specific_input
          @locale = locale
          @origin = origin
          @payment_product_filters = payment_product_filters
          @tokens = tokens
          @variant = variant
        end

        # Sets the property and returns this same instance.
        def with_ask_consumer_consent(value)
          @ask_consumer_consent = value
          self
        end

        # Sets the property and returns this same instance.
        def with_credit_card_specific_input(value)
          @credit_card_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_locale(value)
          @locale = value
          self
        end

        # Sets the property and returns this same instance.
        def with_origin(value)
          @origin = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_product_filters(value)
          @payment_product_filters = value
          self
        end

        # Sets the property and returns this same instance.
        def with_tokens(value)
          @tokens = value
          self
        end

        # Sets the property and returns this same instance.
        def with_variant(value)
          @variant = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['askConsumerConsent'] = @ask_consumer_consent unless @ask_consumer_consent.nil?
          hash['creditCardSpecificInput'] = @credit_card_specific_input.to_h unless @credit_card_specific_input.nil?
          hash['locale'] = @locale unless @locale.nil?
          hash['origin'] = @origin unless @origin.nil?
          hash['paymentProductFilters'] = @payment_product_filters.to_h unless @payment_product_filters.nil?
          hash['tokens'] = @tokens unless @tokens.nil?
          hash['variant'] = @variant unless @variant.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'askConsumerConsent'
            @ask_consumer_consent = hash['askConsumerConsent']
          end
          if hash.key? 'creditCardSpecificInput'
            raise TypeError, "value '#{hash['creditCardSpecificInput']}' is not a Hash" unless hash['creditCardSpecificInput'].is_a? Hash
            @credit_card_specific_input = OnlinePayments::SDK::Domain::CreditCardSpecificInputHostedTokenization.new_from_hash(hash['creditCardSpecificInput'])
          end
          if hash.key? 'locale'
            @locale = hash['locale']
          end
          if hash.key? 'origin'
            @origin = hash['origin']
          end
          if hash.key? 'paymentProductFilters'
            raise TypeError, "value '#{hash['paymentProductFilters']}' is not a Hash" unless hash['paymentProductFilters'].is_a? Hash
            @payment_product_filters = OnlinePayments::SDK::Domain::PaymentProductFiltersHostedTokenization.new_from_hash(hash['paymentProductFilters'])
          end
          if hash.key? 'tokens'
            @tokens = hash['tokens']
          end
          if hash.key? 'variant'
            @variant = hash['variant']
          end
        end
      end
    end
  end
end
