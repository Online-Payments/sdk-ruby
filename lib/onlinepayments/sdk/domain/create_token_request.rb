# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/token_card_specific_input'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::TokenCardSpecificInput, nil] card
      # @attr [String, nil] encrypted_customer_input
      # @attr [Integer, nil] payment_product_id
      class CreateTokenRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card

        attr_accessor :encrypted_customer_input

        attr_accessor :payment_product_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(card: nil, encrypted_customer_input: nil, payment_product_id: nil)
          super()
          @card = card
          @encrypted_customer_input = encrypted_customer_input
          @payment_product_id = payment_product_id
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
        def with_payment_product_id(value)
          @payment_product_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['card'] = @card.to_h unless @card.nil?
          hash['encryptedCustomerInput'] = @encrypted_customer_input unless @encrypted_customer_input.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'card'
            raise TypeError, "value '#{hash['card']}' is not a Hash" unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::TokenCardSpecificInput.new_from_hash(hash['card'])
          end
          if hash.key? 'encryptedCustomerInput'
            @encrypted_customer_input = hash['encryptedCustomerInput']
          end
          if hash.key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
        end
      end
    end
  end
end
