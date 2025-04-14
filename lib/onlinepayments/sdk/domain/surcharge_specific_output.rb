#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/surcharge_rate'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] mode
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] surcharge_amount
      # @attr [OnlinePayments::SDK::Domain::SurchargeRate] surcharge_rate
      class SurchargeSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :mode

        attr_accessor :surcharge_amount

        attr_accessor :surcharge_rate

        # @return (Hash)
        def to_h
          hash = super
          hash['mode'] = @mode unless @mode.nil?
          hash['surchargeAmount'] = @surcharge_amount.to_h unless @surcharge_amount.nil?
          hash['surchargeRate'] = @surcharge_rate.to_h unless @surcharge_rate.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'mode'
            @mode = hash['mode']
          end
          if hash.has_key? 'surchargeAmount'
            raise TypeError, "value '%s' is not a Hash" % [hash['surchargeAmount']] unless hash['surchargeAmount'].is_a? Hash
            @surcharge_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['surchargeAmount'])
          end
          if hash.has_key? 'surchargeRate'
            raise TypeError, "value '%s' is not a Hash" % [hash['surchargeRate']] unless hash['surchargeRate'].is_a? Hash
            @surcharge_rate = OnlinePayments::SDK::Domain::SurchargeRate.new_from_hash(hash['surchargeRate'])
          end
        end
      end
    end
  end
end
