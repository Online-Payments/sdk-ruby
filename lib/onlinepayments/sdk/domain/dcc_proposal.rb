# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/rate_details'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] base_amount
      # @attr [String, nil] disclaimer_display
      # @attr [String, nil] disclaimer_receipt
      # @attr [OnlinePayments::SDK::Domain::RateDetails, nil] rate
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] target_amount
      class DccProposal < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :base_amount

        attr_accessor :disclaimer_display

        attr_accessor :disclaimer_receipt

        attr_accessor :rate

        attr_accessor :target_amount

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(base_amount: nil, disclaimer_display: nil, disclaimer_receipt: nil, rate: nil, target_amount: nil)
          super()
          @base_amount = base_amount
          @disclaimer_display = disclaimer_display
          @disclaimer_receipt = disclaimer_receipt
          @rate = rate
          @target_amount = target_amount
        end

        # Sets the property and returns this same instance.
        def with_base_amount(value)
          @base_amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_disclaimer_display(value)
          @disclaimer_display = value
          self
        end

        # Sets the property and returns this same instance.
        def with_disclaimer_receipt(value)
          @disclaimer_receipt = value
          self
        end

        # Sets the property and returns this same instance.
        def with_rate(value)
          @rate = value
          self
        end

        # Sets the property and returns this same instance.
        def with_target_amount(value)
          @target_amount = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['baseAmount'] = @base_amount.to_h unless @base_amount.nil?
          hash['disclaimerDisplay'] = @disclaimer_display unless @disclaimer_display.nil?
          hash['disclaimerReceipt'] = @disclaimer_receipt unless @disclaimer_receipt.nil?
          hash['rate'] = @rate.to_h unless @rate.nil?
          hash['targetAmount'] = @target_amount.to_h unless @target_amount.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'baseAmount'
            raise TypeError, "value '#{hash['baseAmount']}' is not a Hash" unless hash['baseAmount'].is_a? Hash
            @base_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['baseAmount'])
          end
          if hash.key? 'disclaimerDisplay'
            @disclaimer_display = hash['disclaimerDisplay']
          end
          if hash.key? 'disclaimerReceipt'
            @disclaimer_receipt = hash['disclaimerReceipt']
          end
          if hash.key? 'rate'
            raise TypeError, "value '#{hash['rate']}' is not a Hash" unless hash['rate'].is_a? Hash
            @rate = OnlinePayments::SDK::Domain::RateDetails.new_from_hash(hash['rate'])
          end
          if hash.key? 'targetAmount'
            raise TypeError, "value '#{hash['targetAmount']}' is not a Hash" unless hash['targetAmount'].is_a? Hash
            @target_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['targetAmount'])
          end
        end
      end
    end
  end
end
