# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/additional_order_input'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/customer'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/discount'
require 'onlinepayments/sdk/domain/order_references'
require 'onlinepayments/sdk/domain/shipping'
require 'onlinepayments/sdk/domain/shopping_cart'
require 'onlinepayments/sdk/domain/surcharge_specific_input'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AdditionalOrderInput, nil] additional_input
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] amount_of_money
      # @attr [OnlinePayments::SDK::Domain::Customer, nil] customer
      # @attr [OnlinePayments::SDK::Domain::Discount, nil] discount
      # @attr [OnlinePayments::SDK::Domain::OrderReferences, nil] references
      # @attr [OnlinePayments::SDK::Domain::Shipping, nil] shipping
      # @attr [OnlinePayments::SDK::Domain::ShoppingCart, nil] shopping_cart
      # @attr [OnlinePayments::SDK::Domain::SurchargeSpecificInput, nil] surcharge_specific_input
      # @attr [float, nil] tax_percentage
      # @attr [Integer, nil] total_tax_amount
      class Order < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :additional_input

        attr_accessor :amount_of_money

        attr_accessor :customer

        attr_accessor :discount

        attr_accessor :references

        attr_accessor :shipping

        attr_accessor :shopping_cart

        attr_accessor :surcharge_specific_input

        attr_accessor :tax_percentage

        attr_accessor :total_tax_amount

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(additional_input: nil,
                       amount_of_money: nil,
                       customer: nil,
                       discount: nil,
                       references: nil,
                       shipping: nil,
                       shopping_cart: nil,
                       surcharge_specific_input: nil,
                       tax_percentage: nil,
                       total_tax_amount: nil)
          super()
          @additional_input = additional_input
          @amount_of_money = amount_of_money
          @customer = customer
          @discount = discount
          @references = references
          @shipping = shipping
          @shopping_cart = shopping_cart
          @surcharge_specific_input = surcharge_specific_input
          @tax_percentage = tax_percentage
          @total_tax_amount = total_tax_amount
        end

        # Sets the property and returns this same instance.
        def with_additional_input(value)
          @additional_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_amount_of_money(value)
          @amount_of_money = value
          self
        end

        # Sets the property and returns this same instance.
        def with_customer(value)
          @customer = value
          self
        end

        # Sets the property and returns this same instance.
        def with_discount(value)
          @discount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_references(value)
          @references = value
          self
        end

        # Sets the property and returns this same instance.
        def with_shipping(value)
          @shipping = value
          self
        end

        # Sets the property and returns this same instance.
        def with_shopping_cart(value)
          @shopping_cart = value
          self
        end

        # Sets the property and returns this same instance.
        def with_surcharge_specific_input(value)
          @surcharge_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_tax_percentage(value)
          @tax_percentage = value
          self
        end

        # Sets the property and returns this same instance.
        def with_total_tax_amount(value)
          @total_tax_amount = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['additionalInput'] = @additional_input.to_h unless @additional_input.nil?
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['customer'] = @customer.to_h unless @customer.nil?
          hash['discount'] = @discount.to_h unless @discount.nil?
          hash['references'] = @references.to_h unless @references.nil?
          hash['shipping'] = @shipping.to_h unless @shipping.nil?
          hash['shoppingCart'] = @shopping_cart.to_h unless @shopping_cart.nil?
          hash['surchargeSpecificInput'] = @surcharge_specific_input.to_h unless @surcharge_specific_input.nil?
          hash['taxPercentage'] = @tax_percentage unless @tax_percentage.nil?
          hash['totalTaxAmount'] = @total_tax_amount unless @total_tax_amount.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'additionalInput'
            raise TypeError, "value '#{hash['additionalInput']}' is not a Hash" unless hash['additionalInput'].is_a? Hash
            @additional_input = OnlinePayments::SDK::Domain::AdditionalOrderInput.new_from_hash(hash['additionalInput'])
          end
          if hash.key? 'amountOfMoney'
            raise TypeError, "value '#{hash['amountOfMoney']}' is not a Hash" unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.key? 'customer'
            raise TypeError, "value '#{hash['customer']}' is not a Hash" unless hash['customer'].is_a? Hash
            @customer = OnlinePayments::SDK::Domain::Customer.new_from_hash(hash['customer'])
          end
          if hash.key? 'discount'
            raise TypeError, "value '#{hash['discount']}' is not a Hash" unless hash['discount'].is_a? Hash
            @discount = OnlinePayments::SDK::Domain::Discount.new_from_hash(hash['discount'])
          end
          if hash.key? 'references'
            raise TypeError, "value '#{hash['references']}' is not a Hash" unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::OrderReferences.new_from_hash(hash['references'])
          end
          if hash.key? 'shipping'
            raise TypeError, "value '#{hash['shipping']}' is not a Hash" unless hash['shipping'].is_a? Hash
            @shipping = OnlinePayments::SDK::Domain::Shipping.new_from_hash(hash['shipping'])
          end
          if hash.key? 'shoppingCart'
            raise TypeError, "value '#{hash['shoppingCart']}' is not a Hash" unless hash['shoppingCart'].is_a? Hash
            @shopping_cart = OnlinePayments::SDK::Domain::ShoppingCart.new_from_hash(hash['shoppingCart'])
          end
          if hash.key? 'surchargeSpecificInput'
            raise TypeError, "value '#{hash['surchargeSpecificInput']}' is not a Hash" unless hash['surchargeSpecificInput'].is_a? Hash
            @surcharge_specific_input = OnlinePayments::SDK::Domain::SurchargeSpecificInput.new_from_hash(hash['surchargeSpecificInput'])
          end
          if hash.key? 'taxPercentage'
            @tax_percentage = hash['taxPercentage']
          end
          if hash.key? 'totalTaxAmount'
            @total_tax_amount = hash['totalTaxAmount']
          end
        end
      end
    end
  end
end
