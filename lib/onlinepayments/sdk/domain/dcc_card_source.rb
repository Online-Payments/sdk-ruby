# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card_info'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CardInfo, nil] card
      # @attr [String, nil] encrypted_customer_input
      # @attr [String, nil] hosted_tokenization_id
      # @attr [String, nil] token
      class DccCardSource < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card

        attr_accessor :encrypted_customer_input

        attr_accessor :hosted_tokenization_id

        attr_accessor :token

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(card: nil, encrypted_customer_input: nil, hosted_tokenization_id: nil, token: nil)
          super()
          @card = card
          @encrypted_customer_input = encrypted_customer_input
          @hosted_tokenization_id = hosted_tokenization_id
          @token = token
        end

        # Sets the property and returns this same instance.
        def with_card(value)
          @card = value
          self
        end

        # Sets the property and returns this same instance.
        def with_encrypted_customer_input(value)
          @encrypted_customer_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_hosted_tokenization_id(value)
          @hosted_tokenization_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_token(value)
          @token = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['card'] = @card.to_h unless @card.nil?
          hash['encryptedCustomerInput'] = @encrypted_customer_input unless @encrypted_customer_input.nil?
          hash['hostedTokenizationId'] = @hosted_tokenization_id unless @hosted_tokenization_id.nil?
          hash['token'] = @token unless @token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'card'
            raise TypeError, "value '#{hash['card']}' is not a Hash" unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::CardInfo.new_from_hash(hash['card'])
          end
          if hash.key? 'encryptedCustomerInput'
            @encrypted_customer_input = hash['encryptedCustomerInput']
          end
          if hash.key? 'hostedTokenizationId'
            @hosted_tokenization_id = hash['hostedTokenizationId']
          end
          if hash.key? 'token'
            @token = hash['token']
          end
        end
      end
    end
  end
end
