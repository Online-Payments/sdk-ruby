# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/surcharge_rate'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] net_amount
      # @attr [Integer, nil] payment_product_id
      # @attr [String, nil] result
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] surcharge_amount
      # @attr [OnlinePayments::SDK::Domain::SurchargeRate, nil] surcharge_rate
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] total_amount
      class Surcharge < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :net_amount

        attr_accessor :payment_product_id

        attr_accessor :result

        attr_accessor :surcharge_amount

        attr_accessor :surcharge_rate

        attr_accessor :total_amount

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(net_amount: nil, payment_product_id: nil, result: nil, surcharge_amount: nil, surcharge_rate: nil, total_amount: nil)
          super()
          @net_amount = net_amount
          @payment_product_id = payment_product_id
          @result = result
          @surcharge_amount = surcharge_amount
          @surcharge_rate = surcharge_rate
          @total_amount = total_amount
        end

        # Sets the property and returns this same instance.
        def with_net_amount(value)
          @net_amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_product_id(value)
          @payment_product_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_result(value)
          @result = value
          self
        end

        # Sets the property and returns this same instance.
        def with_surcharge_amount(value)
          @surcharge_amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_surcharge_rate(value)
          @surcharge_rate = value
          self
        end

        # Sets the property and returns this same instance.
        def with_total_amount(value)
          @total_amount = value
          self
        end

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
          if hash.key? 'netAmount'
            raise TypeError, "value '#{hash['netAmount']}' is not a Hash" unless hash['netAmount'].is_a? Hash
            @net_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['netAmount'])
          end
          if hash.key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
          if hash.key? 'result'
            @result = hash['result']
          end
          if hash.key? 'surchargeAmount'
            raise TypeError, "value '#{hash['surchargeAmount']}' is not a Hash" unless hash['surchargeAmount'].is_a? Hash
            @surcharge_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['surchargeAmount'])
          end
          if hash.key? 'surchargeRate'
            raise TypeError, "value '#{hash['surchargeRate']}' is not a Hash" unless hash['surchargeRate'].is_a? Hash
            @surcharge_rate = OnlinePayments::SDK::Domain::SurchargeRate.new_from_hash(hash['surchargeRate'])
          end
          if hash.key? 'totalAmount'
            raise TypeError, "value '#{hash['totalAmount']}' is not a Hash" unless hash['totalAmount'].is_a? Hash
            @total_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['totalAmount'])
          end
        end
      end
    end
  end
end
