# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] cardholder_name
      # @attr [String, nil] expiry_date
      # @attr [String, nil] logo_url
      # @attr [String, nil] masked_pan
      # @attr [Integer, nil] payment_product_id
      # @attr [String, nil] product_name
      # @attr [String, nil] token
      class CardToken < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :cardholder_name

        attr_accessor :expiry_date

        attr_accessor :logo_url

        attr_accessor :masked_pan

        attr_accessor :payment_product_id

        attr_accessor :product_name

        attr_accessor :token

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(cardholder_name: nil, expiry_date: nil, logo_url: nil, masked_pan: nil, payment_product_id: nil, product_name: nil, token: nil)
          super()
          @cardholder_name = cardholder_name
          @expiry_date = expiry_date
          @logo_url = logo_url
          @masked_pan = masked_pan
          @payment_product_id = payment_product_id
          @product_name = product_name
          @token = token
        end

        # Sets the property and returns this same instance.
        def with_cardholder_name(value)
          @cardholder_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_expiry_date(value)
          @expiry_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_logo_url(value)
          @logo_url = value
          self
        end

        # Sets the property and returns this same instance.
        def with_masked_pan(value)
          @masked_pan = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_product_id(value)
          @payment_product_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_product_name(value)
          @product_name = value
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
          hash['cardholderName'] = @cardholder_name unless @cardholder_name.nil?
          hash['expiryDate'] = @expiry_date unless @expiry_date.nil?
          hash['logoUrl'] = @logo_url unless @logo_url.nil?
          hash['maskedPan'] = @masked_pan unless @masked_pan.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash['productName'] = @product_name unless @product_name.nil?
          hash['token'] = @token unless @token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'cardholderName'
            @cardholder_name = hash['cardholderName']
          end
          if hash.key? 'expiryDate'
            @expiry_date = hash['expiryDate']
          end
          if hash.key? 'logoUrl'
            @logo_url = hash['logoUrl']
          end
          if hash.key? 'maskedPan'
            @masked_pan = hash['maskedPan']
          end
          if hash.key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
          if hash.key? 'productName'
            @product_name = hash['productName']
          end
          if hash.key? 'token'
            @token = hash['token']
          end
        end
      end
    end
  end
end
