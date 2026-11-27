# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_session302_specific_input'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentProductSession302SpecificInput, nil] payment_product_session302_specific_input
      class PaymentProductSessionRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_product_session302_specific_input

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(payment_product_session302_specific_input: nil)
          super()
          @payment_product_session302_specific_input = payment_product_session302_specific_input
        end

        # Sets the property and returns this same instance.
        def with_payment_product_session302_specific_input(value)
          @payment_product_session302_specific_input = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentProductSession302SpecificInput'] = @payment_product_session302_specific_input.to_h unless @payment_product_session302_specific_input.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'paymentProductSession302SpecificInput'
            raise TypeError, "value '#{hash['paymentProductSession302SpecificInput']}' is not a Hash" unless hash['paymentProductSession302SpecificInput'].is_a? Hash
            @payment_product_session302_specific_input = OnlinePayments::SDK::Domain::PaymentProductSession302SpecificInput.new_from_hash(hash['paymentProductSession302SpecificInput'])
          end
        end
      end
    end
  end
end
