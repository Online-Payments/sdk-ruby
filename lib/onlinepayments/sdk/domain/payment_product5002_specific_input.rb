# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] checkout_response_signature
      # @attr [String, nil] credit_card_brand
      class PaymentProduct5002SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :checkout_response_signature

        attr_accessor :credit_card_brand

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(checkout_response_signature: nil, credit_card_brand: nil)
          super()
          @checkout_response_signature = checkout_response_signature
          @credit_card_brand = credit_card_brand
        end

        # Sets the property and returns this same instance.
        def with_checkout_response_signature(value)
          @checkout_response_signature = value
          self
        end

        # Sets the property and returns this same instance.
        def with_credit_card_brand(value)
          @credit_card_brand = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['checkoutResponseSignature'] = @checkout_response_signature unless @checkout_response_signature.nil?
          hash['creditCardBrand'] = @credit_card_brand unless @credit_card_brand.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'checkoutResponseSignature'
            @checkout_response_signature = hash['checkoutResponseSignature']
          end
          if hash.key? 'creditCardBrand'
            @credit_card_brand = hash['creditCardBrand']
          end
        end
      end
    end
  end
end
