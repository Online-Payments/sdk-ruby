#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/surcharge_rate'

module OnlinePayments::SDK
  module Domain

    # @attr [String] mode
    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] surcharge_amount
    # @attr [OnlinePayments::SDK::Domain::SurchargeRate] surcharge_rate
    class SurchargeSpecificOutput < OnlinePayments::SDK::DataObject
      attr_accessor :mode
      attr_accessor :surcharge_amount
      attr_accessor :surcharge_rate

      # @return (Hash)
      def to_h
        hash = super
        hash['mode'] = @mode unless @mode.nil?
        hash['surchargeAmount'] = @surcharge_amount.to_h if @surcharge_amount
        hash['surchargeRate'] = @surcharge_rate.to_h if @surcharge_rate
        hash
      end

      def from_hash(hash)
        super
        @mode = hash['mode'] if hash.key? 'mode'
        if hash.key? 'surchargeAmount'
          raise TypeError, "value '%s' is not a Hash" % [hash['surchargeAmount']] unless hash['surchargeAmount'].is_a? Hash
          @surcharge_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['surchargeAmount'])
        end
        if hash.key? 'surchargeRate'
          raise TypeError, "value '%s' is not a Hash" % [hash['surchargeRate']] unless hash['surchargeRate'].is_a? Hash
          @surcharge_rate = OnlinePayments::SDK::Domain::SurchargeRate.new_from_hash(hash['surchargeRate'])
        end
      end
    end
  end
end
