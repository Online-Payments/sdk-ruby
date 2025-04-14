#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/surcharge_rate'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] net_amount
      # @attr [Integer] payment_product_id
      # @attr [String] result
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] surcharge_amount
      # @attr [OnlinePayments::SDK::Domain::SurchargeRate] surcharge_rate
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] total_amount
      class Surcharge < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :net_amount

        attr_accessor :payment_product_id

        attr_accessor :result

        attr_accessor :surcharge_amount

        attr_accessor :surcharge_rate

        attr_accessor :total_amount

        # @return (Hash)
        def to_h
          hash = super
          hash['netAmount'] = @net_amount.to_h unless @net_amount.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash['result'] = @result unless @result.nil?
          hash['surchargeAmount'] = @surcharge_amount.to_h unless @surcharge_amount.nil?
          hash['surchargeRate'] = @surcharge_rate.to_h unless @surcharge_rate.nil?
          hash['totalAmount'] = @total_amount.to_h unless @total_amount.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'netAmount'
            raise TypeError, "value '%s' is not a Hash" % [hash['netAmount']] unless hash['netAmount'].is_a? Hash
            @net_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['netAmount'])
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
          if hash.has_key? 'result'
            @result = hash['result']
          end
          if hash.has_key? 'surchargeAmount'
            raise TypeError, "value '%s' is not a Hash" % [hash['surchargeAmount']] unless hash['surchargeAmount'].is_a? Hash
            @surcharge_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['surchargeAmount'])
          end
          if hash.has_key? 'surchargeRate'
            raise TypeError, "value '%s' is not a Hash" % [hash['surchargeRate']] unless hash['surchargeRate'].is_a? Hash
            @surcharge_rate = OnlinePayments::SDK::Domain::SurchargeRate.new_from_hash(hash['surchargeRate'])
          end
          if hash.has_key? 'totalAmount'
            raise TypeError, "value '%s' is not a Hash" % [hash['totalAmount']] unless hash['totalAmount'].is_a? Hash
            @total_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['totalAmount'])
          end
        end
      end
    end
  end
end
