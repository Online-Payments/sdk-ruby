# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] external_reference
      # @attr [true/false, nil] is_new_token
      # @attr [String, nil] token
      # @attr [true/false, nil] tokenization_succeeded
      class PaymentCreationOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :external_reference

        attr_accessor :is_new_token

        attr_accessor :token

        attr_accessor :tokenization_succeeded

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(external_reference: nil, is_new_token: nil, token: nil, tokenization_succeeded: nil)
          super()
          @external_reference = external_reference
          @is_new_token = is_new_token
          @token = token
          @tokenization_succeeded = tokenization_succeeded
        end

        # Sets the property and returns this same instance.
        def with_external_reference(value)
          @external_reference = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_new_token(value)
          @is_new_token = value
          self
        end

        # Sets the property and returns this same instance.
        def with_token(value)
          @token = value
          self
        end

        # Sets the property and returns this same instance.
        def with_tokenization_succeeded(value)
          @tokenization_succeeded = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['externalReference'] = @external_reference unless @external_reference.nil?
          hash['isNewToken'] = @is_new_token unless @is_new_token.nil?
          hash['token'] = @token unless @token.nil?
          hash['tokenizationSucceeded'] = @tokenization_succeeded unless @tokenization_succeeded.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'externalReference'
            @external_reference = hash['externalReference']
          end
          if hash.key? 'isNewToken'
            @is_new_token = hash['isNewToken']
          end
          if hash.key? 'token'
            @token = hash['token']
          end
          if hash.key? 'tokenizationSucceeded'
            @tokenization_succeeded = hash['tokenizationSucceeded']
          end
        end
      end
    end
  end
end
