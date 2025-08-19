#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/g_pay_three_d_secure'
require 'onlinepayments/sdk/domain/product320_recurring'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] is_recurring
      # @attr [OnlinePayments::SDK::Domain::Product320Recurring] recurring
      # @attr [OnlinePayments::SDK::Domain::GPayThreeDSecure] three_d_secure
      # @attr [true/false] tokenize
      class MobilePaymentProduct320SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :is_recurring

        attr_accessor :recurring

        attr_accessor :three_d_secure

        attr_accessor :tokenize

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
          if hash.has_key? 'isRecurring'
            @is_recurring = hash['isRecurring']
          end
          if hash.has_key? 'recurring'
            raise TypeError, "value '%s' is not a Hash" % [hash['recurring']] unless hash['recurring'].is_a? Hash
            @recurring = OnlinePayments::SDK::Domain::Product320Recurring.new_from_hash(hash['recurring'])
          end
          if hash.has_key? 'threeDSecure'
            raise TypeError, "value '%s' is not a Hash" % [hash['threeDSecure']] unless hash['threeDSecure'].is_a? Hash
            @three_d_secure = OnlinePayments::SDK::Domain::GPayThreeDSecure.new_from_hash(hash['threeDSecure'])
          end
          if hash.has_key? 'tokenize'
            @tokenize = hash['tokenize']
          end
        end
      end
    end
  end
end
