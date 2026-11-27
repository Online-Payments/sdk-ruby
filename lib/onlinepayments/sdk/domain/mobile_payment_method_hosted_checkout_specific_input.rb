# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mobile_payment_product302_specific_input'
require 'onlinepayments/sdk/domain/mobile_payment_product320_specific_input'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] authorization_mode
      # @attr [OnlinePayments::SDK::Domain::MobilePaymentProduct302SpecificInput, nil] payment_product302_specific_input
      # @attr [OnlinePayments::SDK::Domain::MobilePaymentProduct320SpecificInput, nil] payment_product320_specific_input
      # @attr [Integer, nil] payment_product_id
      class MobilePaymentMethodHostedCheckoutSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :authorization_mode

        attr_accessor :payment_product302_specific_input

        attr_accessor :payment_product320_specific_input

        attr_accessor :payment_product_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(authorization_mode: nil, payment_product302_specific_input: nil, payment_product320_specific_input: nil, payment_product_id: nil)
          super()
          @authorization_mode = authorization_mode
          @payment_product302_specific_input = payment_product302_specific_input
          @payment_product320_specific_input = payment_product320_specific_input
          @payment_product_id = payment_product_id
        end

        # Sets the property and returns this same instance.
        def with_authorization_mode(value)
          @authorization_mode = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_product302_specific_input(value)
          @payment_product302_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_product320_specific_input(value)
          @payment_product320_specific_input = value
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
          hash['authorizationMode'] = @authorization_mode unless @authorization_mode.nil?
          hash['paymentProduct302SpecificInput'] = @payment_product302_specific_input.to_h unless @payment_product302_specific_input.nil?
          hash['paymentProduct320SpecificInput'] = @payment_product320_specific_input.to_h unless @payment_product320_specific_input.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'authorizationMode'
            @authorization_mode = hash['authorizationMode']
          end
          if hash.key? 'paymentProduct302SpecificInput'
            raise TypeError, "value '#{hash['paymentProduct302SpecificInput']}' is not a Hash" unless hash['paymentProduct302SpecificInput'].is_a? Hash
            @payment_product302_specific_input = OnlinePayments::SDK::Domain::MobilePaymentProduct302SpecificInput.new_from_hash(hash['paymentProduct302SpecificInput'])
          end
          if hash.key? 'paymentProduct320SpecificInput'
            raise TypeError, "value '#{hash['paymentProduct320SpecificInput']}' is not a Hash" unless hash['paymentProduct320SpecificInput'].is_a? Hash
            @payment_product320_specific_input = OnlinePayments::SDK::Domain::MobilePaymentProduct320SpecificInput.new_from_hash(hash['paymentProduct320SpecificInput'])
          end
          if hash.key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
        end
      end
    end
  end
end
