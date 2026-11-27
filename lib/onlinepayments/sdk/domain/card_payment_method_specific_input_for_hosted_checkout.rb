# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] click_to_pay
      # @attr [true/false, nil] group_cards
      # @attr [Array<Integer>, nil] payment_product_preferred_order
      # @attr [String, nil] tokenization_mode
      class CardPaymentMethodSpecificInputForHostedCheckout < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :click_to_pay

        attr_accessor :group_cards

        attr_accessor :payment_product_preferred_order

        attr_accessor :tokenization_mode

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(click_to_pay: nil, group_cards: nil, payment_product_preferred_order: nil, tokenization_mode: nil)
          super()
          @click_to_pay = click_to_pay
          @group_cards = group_cards
          @payment_product_preferred_order = payment_product_preferred_order
          @tokenization_mode = tokenization_mode
        end

        # Sets the property and returns this same instance.
        def with_click_to_pay(value)
          @click_to_pay = value
          self
        end

        # Sets the property and returns this same instance.
        def with_group_cards(value)
          @group_cards = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_product_preferred_order(value)
          @payment_product_preferred_order = value
          self
        end

        # Sets the property and returns this same instance.
        def with_tokenization_mode(value)
          @tokenization_mode = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['clickToPay'] = @click_to_pay unless @click_to_pay.nil?
          hash['groupCards'] = @group_cards unless @group_cards.nil?
          hash['paymentProductPreferredOrder'] = @payment_product_preferred_order unless @payment_product_preferred_order.nil?
          hash['tokenizationMode'] = @tokenization_mode unless @tokenization_mode.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'clickToPay'
            @click_to_pay = hash['clickToPay']
          end
          if hash.key? 'groupCards'
            @group_cards = hash['groupCards']
          end
          if hash.key? 'paymentProductPreferredOrder'
            raise TypeError, "value '#{hash['paymentProductPreferredOrder']}' is not an Array" unless hash['paymentProductPreferredOrder'].is_a? Array
            @payment_product_preferred_order = []
            hash['paymentProductPreferredOrder'].each do |e|
              @payment_product_preferred_order << e
            end
          end
          if hash.key? 'tokenizationMode'
            @tokenization_mode = hash['tokenizationMode']
          end
        end
      end
    end
  end
end
