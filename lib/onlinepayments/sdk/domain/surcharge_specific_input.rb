#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/amount_of_money'

module OnlinePayments::SDK
  module Domain

    # @attr [String] mode
    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] surcharge_amount
    class SurchargeSpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :mode
      attr_accessor :surcharge_amount

      # @return (Hash)
      def to_h
        hash = super
        hash['mode'] = @mode unless @mode.nil?
        hash['surchargeAmount'] = @surcharge_amount.to_h if @surcharge_amount
        hash
      end

      def from_hash(hash)
        super
        @mode = hash['mode'] if hash.key? 'mode'
        if hash.key? 'surchargeAmount'
          raise TypeError, "value '%s' is not a Hash" % [hash['surchargeAmount']] unless hash['surchargeAmount'].is_a? Hash
          @surcharge_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['surchargeAmount'])
        end
      end
    end
  end
end
