# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] returnmac
      # @attr [String, nil] hosted_checkout_id
      # @attr [Array<String>, nil] invalid_tokens
      # @attr [String, nil] merchant_reference
      # @attr [String, nil] partial_redirect_url
      # @attr [String, nil] redirect_url
      class CreateHostedCheckoutResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :returnmac

        attr_accessor :hosted_checkout_id

        attr_accessor :invalid_tokens

        attr_accessor :merchant_reference

        attr_accessor :partial_redirect_url

        attr_accessor :redirect_url

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(returnmac: nil, hosted_checkout_id: nil, invalid_tokens: nil, merchant_reference: nil, partial_redirect_url: nil, redirect_url: nil)
          super()
          @returnmac = returnmac
          @hosted_checkout_id = hosted_checkout_id
          @invalid_tokens = invalid_tokens
          @merchant_reference = merchant_reference
          @partial_redirect_url = partial_redirect_url
          @redirect_url = redirect_url
        end

        # Sets the property and returns this same instance.
        def with_returnmac(value)
          @returnmac = value
          self
        end

        # Sets the property and returns this same instance.
        def with_hosted_checkout_id(value)
          @hosted_checkout_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_invalid_tokens(value)
          @invalid_tokens = value
          self
        end

        # Sets the property and returns this same instance.
        def with_merchant_reference(value)
          @merchant_reference = value
          self
        end

        # Sets the property and returns this same instance.
        def with_partial_redirect_url(value)
          @partial_redirect_url = value
          self
        end

        # Sets the property and returns this same instance.
        def with_redirect_url(value)
          @redirect_url = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['RETURNMAC'] = @returnmac unless @returnmac.nil?
          hash['hostedCheckoutId'] = @hosted_checkout_id unless @hosted_checkout_id.nil?
          hash['invalidTokens'] = @invalid_tokens unless @invalid_tokens.nil?
          hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
          hash['partialRedirectUrl'] = @partial_redirect_url unless @partial_redirect_url.nil?
          hash['redirectUrl'] = @redirect_url unless @redirect_url.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'RETURNMAC'
            @returnmac = hash['RETURNMAC']
          end
          if hash.key? 'hostedCheckoutId'
            @hosted_checkout_id = hash['hostedCheckoutId']
          end
          if hash.key? 'invalidTokens'
            raise TypeError, "value '#{hash['invalidTokens']}' is not an Array" unless hash['invalidTokens'].is_a? Array
            @invalid_tokens = []
            hash['invalidTokens'].each do |e|
              @invalid_tokens << e
            end
          end
          if hash.key? 'merchantReference'
            @merchant_reference = hash['merchantReference']
          end
          if hash.key? 'partialRedirectUrl'
            @partial_redirect_url = hash['partialRedirectUrl']
          end
          if hash.key? 'redirectUrl'
            @redirect_url = hash['redirectUrl']
          end
        end
      end
    end
  end
end
