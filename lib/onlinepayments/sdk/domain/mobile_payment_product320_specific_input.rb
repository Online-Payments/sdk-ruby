# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/g_pay_three_d_secure'
require 'onlinepayments/sdk/domain/product320_recurring'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] is_recurring
      # @attr [OnlinePayments::SDK::Domain::Product320Recurring, nil] recurring
      # @attr [OnlinePayments::SDK::Domain::GPayThreeDSecure, nil] three_d_secure
      # @attr [true/false, nil] tokenize
      class MobilePaymentProduct320SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :is_recurring

        attr_accessor :recurring

        attr_accessor :three_d_secure

        attr_accessor :tokenize

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(is_recurring: nil, recurring: nil, three_d_secure: nil, tokenize: nil)
          super()
          @is_recurring = is_recurring
          @recurring = recurring
          @three_d_secure = three_d_secure
          @tokenize = tokenize
        end

        # Sets the property and returns this same instance.
        def with_is_recurring(value)
          @is_recurring = value
          self
        end

        # Sets the property and returns this same instance.
        def with_recurring(value)
          @recurring = value
          self
        end

        # Sets the property and returns this same instance.
        def with_three_d_secure(value)
          @three_d_secure = value
          self
        end

        # Sets the property and returns this same instance.
        def with_tokenize(value)
          @tokenize = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['isRecurring'] = @is_recurring unless @is_recurring.nil?
          hash['recurring'] = @recurring.to_h unless @recurring.nil?
          hash['threeDSecure'] = @three_d_secure.to_h unless @three_d_secure.nil?
          hash['tokenize'] = @tokenize unless @tokenize.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'isRecurring'
            @is_recurring = hash['isRecurring']
          end
          if hash.key? 'recurring'
            raise TypeError, "value '#{hash['recurring']}' is not a Hash" unless hash['recurring'].is_a? Hash
            @recurring = OnlinePayments::SDK::Domain::Product320Recurring.new_from_hash(hash['recurring'])
          end
          if hash.key? 'threeDSecure'
            raise TypeError, "value '#{hash['threeDSecure']}' is not a Hash" unless hash['threeDSecure'].is_a? Hash
            @three_d_secure = OnlinePayments::SDK::Domain::GPayThreeDSecure.new_from_hash(hash['threeDSecure'])
          end
          if hash.key? 'tokenize'
            @tokenize = hash['tokenize']
          end
        end
      end
    end
  end
end
