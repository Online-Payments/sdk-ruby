#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [true/false] ask_consumer_consent
    # @attr [String] locale
    # @attr [String] tokens
    # @attr [String] variant
    class CreateHostedTokenizationRequest < OnlinePayments::SDK::DataObject
      attr_accessor :ask_consumer_consent
      attr_accessor :locale
      attr_accessor :tokens
      attr_accessor :variant

      # @return (Hash)
      def to_h
        hash = super
        hash['askConsumerConsent'] = @ask_consumer_consent unless @ask_consumer_consent.nil?
        hash['locale'] = @locale unless @locale.nil?
        hash['tokens'] = @tokens unless @tokens.nil?
        hash['variant'] = @variant unless @variant.nil?
        hash
      end

      def from_hash(hash)
        super
        @ask_consumer_consent = hash['askConsumerConsent'] if hash.key? 'askConsumerConsent'
        @locale = hash['locale'] if hash.key? 'locale'
        @tokens = hash['tokens'] if hash.key? 'tokens'
        @variant = hash['variant'] if hash.key? 'variant'
      end
    end
  end
end
