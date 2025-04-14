#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<String>] expired_card_tokens
      # @attr [String] hosted_tokenization_id
      # @attr [String] hosted_tokenization_url
      # @attr [Array<String>] invalid_tokens
      # @attr [String] partial_redirect_url
      class CreateHostedTokenizationResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :expired_card_tokens

        attr_accessor :hosted_tokenization_id

        attr_accessor :hosted_tokenization_url

        attr_accessor :invalid_tokens

        # @deprecated Deprecated
        attr_accessor :partial_redirect_url

        # @return (Hash)
        def to_h
          hash = super
          hash['expiredCardTokens'] = @expired_card_tokens unless @expired_card_tokens.nil?
          hash['hostedTokenizationId'] = @hosted_tokenization_id unless @hosted_tokenization_id.nil?
          hash['hostedTokenizationUrl'] = @hosted_tokenization_url unless @hosted_tokenization_url.nil?
          hash['invalidTokens'] = @invalid_tokens unless @invalid_tokens.nil?
          hash['partialRedirectUrl'] = @partial_redirect_url unless @partial_redirect_url.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'expiredCardTokens'
            raise TypeError, "value '%s' is not an Array" % [hash['expiredCardTokens']] unless hash['expiredCardTokens'].is_a? Array
            @expired_card_tokens = []
            hash['expiredCardTokens'].each do |e|
              @expired_card_tokens << e
            end
          end
          if hash.has_key? 'hostedTokenizationId'
            @hosted_tokenization_id = hash['hostedTokenizationId']
          end
          if hash.has_key? 'hostedTokenizationUrl'
            @hosted_tokenization_url = hash['hostedTokenizationUrl']
          end
          if hash.has_key? 'invalidTokens'
            raise TypeError, "value '%s' is not an Array" % [hash['invalidTokens']] unless hash['invalidTokens'].is_a? Array
            @invalid_tokens = []
            hash['invalidTokens'].each do |e|
              @invalid_tokens << e
            end
          end
          if hash.has_key? 'partialRedirectUrl'
            @partial_redirect_url = hash['partialRedirectUrl']
          end
        end
      end
    end
  end
end
