#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/surcharge_rate'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] net_amount
    # @attr [Integer] payment_product_id
    # @attr [String] result
    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] surcharge_amount
    # @attr [OnlinePayments::SDK::Domain::SurchargeRate] surcharge_rate
    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] total_amount
    class Surcharge < OnlinePayments::SDK::DataObject
      attr_accessor :net_amount
      attr_accessor :payment_product_id
      attr_accessor :result
      attr_accessor :surcharge_amount
      attr_accessor :surcharge_rate
      attr_accessor :total_amount

      # @return (Hash)
      def to_h
        hash = super
        hash['netAmount'] = @net_amount.to_h if @net_amount
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['result'] = @result unless @result.nil?
        hash['surchargeAmount'] = @surcharge_amount.to_h if @surcharge_amount
        hash['surchargeRate'] = @surcharge_rate.to_h if @surcharge_rate
        hash['totalAmount'] = @total_amount.to_h if @total_amount
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'netAmount'
          raise TypeError, "value '%s' is not a Hash" % [hash['netAmount']] unless hash['netAmount'].is_a? Hash
          @net_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['netAmount'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        @result = hash['result'] if hash.key? 'result'
        if hash.key? 'surchargeAmount'
          raise TypeError, "value '%s' is not a Hash" % [hash['surchargeAmount']] unless hash['surchargeAmount'].is_a? Hash
          @surcharge_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['surchargeAmount'])
        end
        if hash.key? 'surchargeRate'
          raise TypeError, "value '%s' is not a Hash" % [hash['surchargeRate']] unless hash['surchargeRate'].is_a? Hash
          @surcharge_rate = OnlinePayments::SDK::Domain::SurchargeRate.new_from_hash(hash['surchargeRate'])
        end
        if hash.key? 'totalAmount'
          raise TypeError, "value '%s' is not a Hash" % [hash['totalAmount']] unless hash['totalAmount'].is_a? Hash
          @total_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['totalAmount'])
        end
      end
    end
  end
end
