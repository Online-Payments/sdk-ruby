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
      # @attr [OnlinePayments::SDK::Domain::AdditionalOrderInput] additional_input
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
      # @attr [OnlinePayments::SDK::Domain::Customer] customer
      # @attr [OnlinePayments::SDK::Domain::Discount] discount
      # @attr [OnlinePayments::SDK::Domain::OrderReferences] references
      # @attr [OnlinePayments::SDK::Domain::Shipping] shipping
      # @attr [OnlinePayments::SDK::Domain::ShoppingCart] shopping_cart
      # @attr [OnlinePayments::SDK::Domain::SurchargeSpecificInput] surcharge_specific_input
      class Order < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :additional_input

        attr_accessor :amount_of_money

        attr_accessor :customer

        attr_accessor :discount

        attr_accessor :references

        attr_accessor :shipping

        attr_accessor :shopping_cart

        attr_accessor :surcharge_specific_input

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
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'additionalInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['additionalInput']] unless hash['additionalInput'].is_a? Hash
            @additional_input = OnlinePayments::SDK::Domain::AdditionalOrderInput.new_from_hash(hash['additionalInput'])
          end
          if hash.has_key? 'amountOfMoney'
            raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.has_key? 'customer'
            raise TypeError, "value '%s' is not a Hash" % [hash['customer']] unless hash['customer'].is_a? Hash
            @customer = OnlinePayments::SDK::Domain::Customer.new_from_hash(hash['customer'])
          end
          if hash.has_key? 'discount'
            raise TypeError, "value '%s' is not a Hash" % [hash['discount']] unless hash['discount'].is_a? Hash
            @discount = OnlinePayments::SDK::Domain::Discount.new_from_hash(hash['discount'])
          end
          if hash.has_key? 'references'
            raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::OrderReferences.new_from_hash(hash['references'])
          end
          if hash.has_key? 'shipping'
            raise TypeError, "value '%s' is not a Hash" % [hash['shipping']] unless hash['shipping'].is_a? Hash
            @shipping = OnlinePayments::SDK::Domain::Shipping.new_from_hash(hash['shipping'])
          end
          if hash.has_key? 'shoppingCart'
            raise TypeError, "value '%s' is not a Hash" % [hash['shoppingCart']] unless hash['shoppingCart'].is_a? Hash
            @shopping_cart = OnlinePayments::SDK::Domain::ShoppingCart.new_from_hash(hash['shoppingCart'])
          end
          if hash.has_key? 'surchargeSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['surchargeSpecificInput']] unless hash['surchargeSpecificInput'].is_a? Hash
            @surcharge_specific_input = OnlinePayments::SDK::Domain::SurchargeSpecificInput.new_from_hash(hash['surchargeSpecificInput'])
          end
        end
      end
    end
  end
end
