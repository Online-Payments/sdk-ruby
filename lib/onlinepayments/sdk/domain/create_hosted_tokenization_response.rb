#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [Array<String>] expired_card_tokens
    # @attr [String] hosted_tokenization_id
    # @attr [Array<String>] invalid_tokens
    # @attr [String] partial_redirect_url
    class CreateHostedTokenizationResponse < OnlinePayments::SDK::DataObject
      attr_accessor :expired_card_tokens
      attr_accessor :hosted_tokenization_id
      attr_accessor :invalid_tokens
      attr_accessor :partial_redirect_url

      # @return (Hash)
      def to_h
        hash = super
        hash['expiredCardTokens'] = @expired_card_tokens unless @expired_card_tokens.nil?
        hash['hostedTokenizationId'] = @hosted_tokenization_id unless @hosted_tokenization_id.nil?
        hash['invalidTokens'] = @invalid_tokens unless @invalid_tokens.nil?
        hash['partialRedirectUrl'] = @partial_redirect_url unless @partial_redirect_url.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'expiredCardTokens'
          raise TypeError, "value '%s' is not an Array" % [hash['expiredCardTokens']] unless hash['expiredCardTokens'].is_a? Array
          @expired_card_tokens = []
          hash['expiredCardTokens'].each do |e|
            @expired_card_tokens << e
          end
        end
        @hosted_tokenization_id = hash['hostedTokenizationId'] if hash.key? 'hostedTokenizationId'
        if hash.key? 'invalidTokens'
          raise TypeError, "value '%s' is not an Array" % [hash['invalidTokens']] unless hash['invalidTokens'].is_a? Array
          @invalid_tokens = []
          hash['invalidTokens'].each do |e|
            @invalid_tokens << e
          end
        end
        @partial_redirect_url = hash['partialRedirectUrl'] if hash.key? 'partialRedirectUrl'
      end
    end
  end
end
