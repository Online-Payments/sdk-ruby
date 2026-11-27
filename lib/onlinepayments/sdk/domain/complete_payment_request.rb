# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/complete_payment_card_payment_method_specific_input'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/order'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CompletePaymentCardPaymentMethodSpecificInput, nil] card_payment_method_specific_input
      # @attr [OnlinePayments::SDK::Domain::Order, nil] order
      class CompletePaymentRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_payment_method_specific_input

        attr_accessor :order

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(card_payment_method_specific_input: nil, order: nil)
          super()
          @card_payment_method_specific_input = card_payment_method_specific_input
          @order = order
        end

        # Sets the property and returns this same instance.
        def with_card_payment_method_specific_input(value)
          @card_payment_method_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_order(value)
          @order = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['cardPaymentMethodSpecificInput'] = @card_payment_method_specific_input.to_h unless @card_payment_method_specific_input.nil?
          hash['order'] = @order.to_h unless @order.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'cardPaymentMethodSpecificInput'
            raise TypeError, "value '#{hash['cardPaymentMethodSpecificInput']}' is not a Hash" unless hash['cardPaymentMethodSpecificInput'].is_a? Hash
            @card_payment_method_specific_input = OnlinePayments::SDK::Domain::CompletePaymentCardPaymentMethodSpecificInput.new_from_hash(hash['cardPaymentMethodSpecificInput'])
          end
          if hash.key? 'order'
            raise TypeError, "value '#{hash['order']}' is not a Hash" unless hash['order'].is_a? Hash
            @order = OnlinePayments::SDK::Domain::Order.new_from_hash(hash['order'])
          end
        end
      end
    end
  end
end
