# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<String>, nil] expired_card_tokens
      # @attr [String, nil] hosted_tokenization_id
      # @attr [String, nil] hosted_tokenization_url
      # @attr [Array<String>, nil] invalid_tokens
      # @attr [String, nil] partial_redirect_url
      # @attr [String, nil] sri
      class CreateHostedTokenizationResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :expired_card_tokens

        attr_accessor :hosted_tokenization_id

        attr_accessor :hosted_tokenization_url

        attr_accessor :invalid_tokens

        # @deprecated Deprecated
        attr_accessor :partial_redirect_url

        attr_accessor :sri

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(expired_card_tokens: nil,
                       hosted_tokenization_id: nil,
                       hosted_tokenization_url: nil,
                       invalid_tokens: nil,
                       partial_redirect_url: nil,
                       sri: nil)
          super()
          @expired_card_tokens = expired_card_tokens
          @hosted_tokenization_id = hosted_tokenization_id
          @hosted_tokenization_url = hosted_tokenization_url
          @invalid_tokens = invalid_tokens
          @partial_redirect_url = partial_redirect_url
          @sri = sri
        end

        # Sets the property and returns this same instance.
        def with_expired_card_tokens(value)
          @expired_card_tokens = value
          self
        end

        # Sets the property and returns this same instance.
        def with_hosted_tokenization_id(value)
          @hosted_tokenization_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_hosted_tokenization_url(value)
          @hosted_tokenization_url = value
          self
        end

        # Sets the property and returns this same instance.
        def with_invalid_tokens(value)
          @invalid_tokens = value
          self
        end

        # Sets the property and returns this same instance.
        def with_partial_redirect_url(value)
          @partial_redirect_url = value
          self
        end

        # Sets the property and returns this same instance.
        def with_sri(value)
          @sri = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['expiredCardTokens'] = @expired_card_tokens unless @expired_card_tokens.nil?
          hash['hostedTokenizationId'] = @hosted_tokenization_id unless @hosted_tokenization_id.nil?
          hash['hostedTokenizationUrl'] = @hosted_tokenization_url unless @hosted_tokenization_url.nil?
          hash['invalidTokens'] = @invalid_tokens unless @invalid_tokens.nil?
          hash['partialRedirectUrl'] = @partial_redirect_url unless @partial_redirect_url.nil?
          hash['sri'] = @sri unless @sri.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'expiredCardTokens'
            raise TypeError, "value '#{hash['expiredCardTokens']}' is not an Array" unless hash['expiredCardTokens'].is_a? Array
            @expired_card_tokens = []
            hash['expiredCardTokens'].each do |e|
              @expired_card_tokens << e
            end
          end
          if hash.key? 'hostedTokenizationId'
            @hosted_tokenization_id = hash['hostedTokenizationId']
          end
          if hash.key? 'hostedTokenizationUrl'
            @hosted_tokenization_url = hash['hostedTokenizationUrl']
          end
          if hash.key? 'invalidTokens'
            raise TypeError, "value '#{hash['invalidTokens']}' is not an Array" unless hash['invalidTokens'].is_a? Array
            @invalid_tokens = []
            hash['invalidTokens'].each do |e|
              @invalid_tokens << e
            end
          end
          if hash.key? 'partialRedirectUrl'
            @partial_redirect_url = hash['partialRedirectUrl']
          end
          if hash.key? 'sri'
            @sri = hash['sri']
          end
        end
      end
    end
  end
end
