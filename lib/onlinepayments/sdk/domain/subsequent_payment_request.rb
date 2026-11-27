# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/omnichannel_subsequent_specific_input'
require 'onlinepayments/sdk/domain/order'
require 'onlinepayments/sdk/domain/subsequent_card_payment_method_specific_input'
require 'onlinepayments/sdk/domain/subsequent_payment_product5001_specific_input'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::OmnichannelSubsequentSpecificInput, nil] omnichannel_subsequent_specific_input
      # @attr [OnlinePayments::SDK::Domain::Order, nil] order
      # @attr [OnlinePayments::SDK::Domain::SubsequentPaymentProduct5001SpecificInput, nil] subsequent_payment_product5001_specific_input
      # @attr [OnlinePayments::SDK::Domain::SubsequentCardPaymentMethodSpecificInput, nil] subsequentcard_payment_method_specific_input
      class SubsequentPaymentRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :omnichannel_subsequent_specific_input

        attr_accessor :order

        attr_accessor :subsequent_payment_product5001_specific_input

        attr_accessor :subsequentcard_payment_method_specific_input

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(omnichannel_subsequent_specific_input: nil,
                       order: nil,
                       subsequent_payment_product5001_specific_input: nil,
                       subsequentcard_payment_method_specific_input: nil)
          super()
          @omnichannel_subsequent_specific_input = omnichannel_subsequent_specific_input
          @order = order
          @subsequent_payment_product5001_specific_input = subsequent_payment_product5001_specific_input
          @subsequentcard_payment_method_specific_input = subsequentcard_payment_method_specific_input
        end

        # Sets the property and returns this same instance.
        def with_omnichannel_subsequent_specific_input(value)
          @omnichannel_subsequent_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_order(value)
          @order = value
          self
        end

        # Sets the property and returns this same instance.
        def with_subsequent_payment_product5001_specific_input(value)
          @subsequent_payment_product5001_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_subsequentcard_payment_method_specific_input(value)
          @subsequentcard_payment_method_specific_input = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['omnichannelSubsequentSpecificInput'] = @omnichannel_subsequent_specific_input.to_h unless @omnichannel_subsequent_specific_input.nil?
          hash['order'] = @order.to_h unless @order.nil?
          hash['subsequentPaymentProduct5001SpecificInput'] = @subsequent_payment_product5001_specific_input.to_h unless @subsequent_payment_product5001_specific_input.nil?
          hash['subsequentcardPaymentMethodSpecificInput'] = @subsequentcard_payment_method_specific_input.to_h unless @subsequentcard_payment_method_specific_input.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'omnichannelSubsequentSpecificInput'
            raise TypeError, "value '#{hash['omnichannelSubsequentSpecificInput']}' is not a Hash" unless hash['omnichannelSubsequentSpecificInput'].is_a? Hash
            @omnichannel_subsequent_specific_input = OnlinePayments::SDK::Domain::OmnichannelSubsequentSpecificInput.new_from_hash(hash['omnichannelSubsequentSpecificInput'])
          end
          if hash.key? 'order'
            raise TypeError, "value '#{hash['order']}' is not a Hash" unless hash['order'].is_a? Hash
            @order = OnlinePayments::SDK::Domain::Order.new_from_hash(hash['order'])
          end
          if hash.key? 'subsequentPaymentProduct5001SpecificInput'
            raise TypeError, "value '#{hash['subsequentPaymentProduct5001SpecificInput']}' is not a Hash" unless hash['subsequentPaymentProduct5001SpecificInput'].is_a? Hash
            @subsequent_payment_product5001_specific_input = OnlinePayments::SDK::Domain::SubsequentPaymentProduct5001SpecificInput.new_from_hash(hash['subsequentPaymentProduct5001SpecificInput'])
          end
          if hash.key? 'subsequentcardPaymentMethodSpecificInput'
            raise TypeError, "value '#{hash['subsequentcardPaymentMethodSpecificInput']}' is not a Hash" unless hash['subsequentcardPaymentMethodSpecificInput'].is_a? Hash
            @subsequentcard_payment_method_specific_input = OnlinePayments::SDK::Domain::SubsequentCardPaymentMethodSpecificInput.new_from_hash(hash['subsequentcardPaymentMethodSpecificInput'])
          end
        end
      end
    end
  end
end
