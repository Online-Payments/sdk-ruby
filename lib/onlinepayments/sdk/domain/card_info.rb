# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] card_number
      # @attr [Integer, nil] payment_product_id
      class CardInfo < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_number

        attr_accessor :payment_product_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(card_number: nil, payment_product_id: nil)
          super()
          @card_number = card_number
          @payment_product_id = payment_product_id
        end

        # Sets the property and returns this same instance.
        def with_card_number(value)
          @card_number = value
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
          hash['cardNumber'] = @card_number unless @card_number.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'cardNumber'
            @card_number = hash['cardNumber']
          end
          if hash.key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
        end
      end
    end
  end
end
