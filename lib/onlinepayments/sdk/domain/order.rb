#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/additional_order_input'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/customer'
require 'onlinepayments/sdk/domain/discount'
require 'onlinepayments/sdk/domain/order_references'
require 'onlinepayments/sdk/domain/shipping'
require 'onlinepayments/sdk/domain/shopping_cart'
require 'onlinepayments/sdk/domain/surcharge_specific_input'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AdditionalOrderInput] additional_input
    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
    # @attr [OnlinePayments::SDK::Domain::Customer] customer
    # @attr [OnlinePayments::SDK::Domain::Discount] discount
    # @attr [OnlinePayments::SDK::Domain::OrderReferences] references
    # @attr [OnlinePayments::SDK::Domain::Shipping] shipping
    # @attr [OnlinePayments::SDK::Domain::ShoppingCart] shopping_cart
    # @attr [OnlinePayments::SDK::Domain::SurchargeSpecificInput] surcharge_specific_input
    class Order < OnlinePayments::SDK::DataObject
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
        hash['additionalInput'] = @additional_input.to_h if @additional_input
        hash['amountOfMoney'] = @amount_of_money.to_h if @amount_of_money
        hash['customer'] = @customer.to_h if @customer
        hash['discount'] = @discount.to_h if @discount
        hash['references'] = @references.to_h if @references
        hash['shipping'] = @shipping.to_h if @shipping
        hash['shoppingCart'] = @shopping_cart.to_h if @shopping_cart
        hash['surchargeSpecificInput'] = @surcharge_specific_input.to_h if @surcharge_specific_input
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'additionalInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['additionalInput']] unless hash['additionalInput'].is_a? Hash
          @additional_input = OnlinePayments::SDK::Domain::AdditionalOrderInput.new_from_hash(hash['additionalInput'])
        end
        if hash.key? 'amountOfMoney'
          raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
          @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        if hash.key? 'customer'
          raise TypeError, "value '%s' is not a Hash" % [hash['customer']] unless hash['customer'].is_a? Hash
          @customer = OnlinePayments::SDK::Domain::Customer.new_from_hash(hash['customer'])
        end
        if hash.key? 'discount'
          raise TypeError, "value '%s' is not a Hash" % [hash['discount']] unless hash['discount'].is_a? Hash
          @discount = OnlinePayments::SDK::Domain::Discount.new_from_hash(hash['discount'])
        end
        if hash.key? 'references'
          raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
          @references = OnlinePayments::SDK::Domain::OrderReferences.new_from_hash(hash['references'])
        end
        if hash.key? 'shipping'
          raise TypeError, "value '%s' is not a Hash" % [hash['shipping']] unless hash['shipping'].is_a? Hash
          @shipping = OnlinePayments::SDK::Domain::Shipping.new_from_hash(hash['shipping'])
        end
        if hash.key? 'shoppingCart'
          raise TypeError, "value '%s' is not a Hash" % [hash['shoppingCart']] unless hash['shoppingCart'].is_a? Hash
          @shopping_cart = OnlinePayments::SDK::Domain::ShoppingCart.new_from_hash(hash['shoppingCart'])
        end
        if hash.key? 'surchargeSpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['surchargeSpecificInput']] unless hash['surchargeSpecificInput'].is_a? Hash
          @surcharge_specific_input = OnlinePayments::SDK::Domain::SurchargeSpecificInput.new_from_hash(hash['surchargeSpecificInput'])
        end
      end
    end
  end
end
