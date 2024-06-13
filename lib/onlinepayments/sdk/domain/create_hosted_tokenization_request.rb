#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/credit_card_specific_input_hosted_tokenization'
require 'onlinepayments/sdk/domain/page_customization'
require 'onlinepayments/sdk/domain/payment_product_filters_hosted_tokenization'

module OnlinePayments::SDK
  module Domain

    # @attr [true/false] ask_consumer_consent
    # @attr [OnlinePayments::SDK::Domain::CreditCardSpecificInputHostedTokenization] credit_card_specific_input
    # @attr [String] locale
    # @attr [OnlinePayments::SDK::Domain::PageCustomization] page_customization
    # @attr [OnlinePayments::SDK::Domain::PaymentProductFiltersHostedTokenization] payment_product_filters
    # @attr [String] tokens
    # @attr [String] variant
    class CreateHostedTokenizationRequest < OnlinePayments::SDK::DataObject
      attr_accessor :ask_consumer_consent
      attr_accessor :credit_card_specific_input
      attr_accessor :locale
      attr_accessor :page_customization
      attr_accessor :payment_product_filters
      attr_accessor :tokens
      attr_accessor :variant

      # @return (Hash)
      def to_h
        hash = super
        hash['askConsumerConsent'] = @ask_consumer_consent unless @ask_consumer_consent.nil?
        hash['creditCardSpecificInput'] = @credit_card_specific_input.to_h if @credit_card_specific_input
        hash['locale'] = @locale unless @locale.nil?
        hash['pageCustomization'] = @page_customization.to_h if @page_customization
        hash['paymentProductFilters'] = @payment_product_filters.to_h if @payment_product_filters
        hash['tokens'] = @tokens unless @tokens.nil?
        hash['variant'] = @variant unless @variant.nil?
        hash
      end

      def from_hash(hash)
        super
        @ask_consumer_consent = hash['askConsumerConsent'] if hash.key? 'askConsumerConsent'
        if hash.key? 'creditCardSpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['creditCardSpecificInput']] unless hash['creditCardSpecificInput'].is_a? Hash
          @credit_card_specific_input = OnlinePayments::SDK::Domain::CreditCardSpecificInputHostedTokenization.new_from_hash(hash['creditCardSpecificInput'])
        end
        @locale = hash['locale'] if hash.key? 'locale'
        if hash.key? 'pageCustomization'
          raise TypeError, "value '%s' is not a Hash" % [hash['pageCustomization']] unless hash['pageCustomization'].is_a? Hash
          @page_customization = OnlinePayments::SDK::Domain::PageCustomization.new_from_hash(hash['pageCustomization'])
        end
        if hash.key? 'paymentProductFilters'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProductFilters']] unless hash['paymentProductFilters'].is_a? Hash
          @payment_product_filters = OnlinePayments::SDK::Domain::PaymentProductFiltersHostedTokenization.new_from_hash(hash['paymentProductFilters'])
        end
        @tokens = hash['tokens'] if hash.key? 'tokens'
        @variant = hash['variant'] if hash.key? 'variant'
      end
    end
  end
end
