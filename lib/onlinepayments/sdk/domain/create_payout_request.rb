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
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
      # @attr [OnlinePayments::SDK::Domain::CardPayoutMethodSpecificInput] card_payout_method_specific_input
      # @attr [String] descriptor
      # @attr [OnlinePayments::SDK::Domain::Feedbacks] feedbacks
      # @attr [OnlinePayments::SDK::Domain::OmnichannelPayoutSpecificInput] omnichannel_payout_specific_input
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences] references
      class CreatePayoutRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :card_payout_method_specific_input

        attr_accessor :descriptor

        attr_accessor :feedbacks

        attr_accessor :omnichannel_payout_specific_input

        attr_accessor :references

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
          if hash.has_key? 'amountOfMoney'
            raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.has_key? 'cardPayoutMethodSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['cardPayoutMethodSpecificInput']] unless hash['cardPayoutMethodSpecificInput'].is_a? Hash
            @card_payout_method_specific_input = OnlinePayments::SDK::Domain::CardPayoutMethodSpecificInput.new_from_hash(hash['cardPayoutMethodSpecificInput'])
          end
          if hash.has_key? 'descriptor'
            @descriptor = hash['descriptor']
          end
          if hash.has_key? 'feedbacks'
            raise TypeError, "value '%s' is not a Hash" % [hash['feedbacks']] unless hash['feedbacks'].is_a? Hash
            @feedbacks = OnlinePayments::SDK::Domain::Feedbacks.new_from_hash(hash['feedbacks'])
          end
          if hash.has_key? 'omnichannelPayoutSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['omnichannelPayoutSpecificInput']] unless hash['omnichannelPayoutSpecificInput'].is_a? Hash
            @omnichannel_payout_specific_input = OnlinePayments::SDK::Domain::OmnichannelPayoutSpecificInput.new_from_hash(hash['omnichannelPayoutSpecificInput'])
          end
          if hash.has_key? 'references'
            raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
          end
        end
      end
    end
  end
end
