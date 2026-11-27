# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/card_payout_method_specific_input'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/feedbacks'
require 'onlinepayments/sdk/domain/omnichannel_payout_specific_input'
require 'onlinepayments/sdk/domain/payment_references'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] amount_of_money
      # @attr [OnlinePayments::SDK::Domain::CardPayoutMethodSpecificInput, nil] card_payout_method_specific_input
      # @attr [String, nil] descriptor
      # @attr [OnlinePayments::SDK::Domain::Feedbacks, nil] feedbacks
      # @attr [OnlinePayments::SDK::Domain::OmnichannelPayoutSpecificInput, nil] omnichannel_payout_specific_input
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences, nil] references
      class CreatePayoutRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :card_payout_method_specific_input

        attr_accessor :descriptor

        attr_accessor :feedbacks

        attr_accessor :omnichannel_payout_specific_input

        attr_accessor :references

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount_of_money: nil,
                       card_payout_method_specific_input: nil,
                       descriptor: nil,
                       feedbacks: nil,
                       omnichannel_payout_specific_input: nil,
                       references: nil)
          super()
          @amount_of_money = amount_of_money
          @card_payout_method_specific_input = card_payout_method_specific_input
          @descriptor = descriptor
          @feedbacks = feedbacks
          @omnichannel_payout_specific_input = omnichannel_payout_specific_input
          @references = references
        end

        # Sets the property and returns this same instance.
        def with_amount_of_money(value)
          @amount_of_money = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_payout_method_specific_input(value)
          @card_payout_method_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_descriptor(value)
          @descriptor = value
          self
        end

        # Sets the property and returns this same instance.
        def with_feedbacks(value)
          @feedbacks = value
          self
        end

        # Sets the property and returns this same instance.
        def with_omnichannel_payout_specific_input(value)
          @omnichannel_payout_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_references(value)
          @references = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['cardPayoutMethodSpecificInput'] = @card_payout_method_specific_input.to_h unless @card_payout_method_specific_input.nil?
          hash['descriptor'] = @descriptor unless @descriptor.nil?
          hash['feedbacks'] = @feedbacks.to_h unless @feedbacks.nil?
          hash['omnichannelPayoutSpecificInput'] = @omnichannel_payout_specific_input.to_h unless @omnichannel_payout_specific_input.nil?
          hash['references'] = @references.to_h unless @references.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'amountOfMoney'
            raise TypeError, "value '#{hash['amountOfMoney']}' is not a Hash" unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.key? 'cardPayoutMethodSpecificInput'
            raise TypeError, "value '#{hash['cardPayoutMethodSpecificInput']}' is not a Hash" unless hash['cardPayoutMethodSpecificInput'].is_a? Hash
            @card_payout_method_specific_input = OnlinePayments::SDK::Domain::CardPayoutMethodSpecificInput.new_from_hash(hash['cardPayoutMethodSpecificInput'])
          end
          if hash.key? 'descriptor'
            @descriptor = hash['descriptor']
          end
          if hash.key? 'feedbacks'
            raise TypeError, "value '#{hash['feedbacks']}' is not a Hash" unless hash['feedbacks'].is_a? Hash
            @feedbacks = OnlinePayments::SDK::Domain::Feedbacks.new_from_hash(hash['feedbacks'])
          end
          if hash.key? 'omnichannelPayoutSpecificInput'
            raise TypeError, "value '#{hash['omnichannelPayoutSpecificInput']}' is not a Hash" unless hash['omnichannelPayoutSpecificInput'].is_a? Hash
            @omnichannel_payout_specific_input = OnlinePayments::SDK::Domain::OmnichannelPayoutSpecificInput.new_from_hash(hash['omnichannelPayoutSpecificInput'])
          end
          if hash.key? 'references'
            raise TypeError, "value '#{hash['references']}' is not a Hash" unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
          end
        end
      end
    end
  end
end
