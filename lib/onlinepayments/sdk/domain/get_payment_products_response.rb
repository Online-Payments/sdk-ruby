# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::PaymentProduct>, nil] payment_products
      class GetPaymentProductsResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_products

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(payment_products: nil)
          super()
          @payment_products = payment_products
        end

        # Sets the property and returns this same instance.
        def with_payment_products(value)
          @payment_products = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentProducts'] = @payment_products.collect{|val| val.to_h} unless @payment_products.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'paymentProducts'
            raise TypeError, "value '#{hash['paymentProducts']}' is not an Array" unless hash['paymentProducts'].is_a? Array
            @payment_products = []
            hash['paymentProducts'].each do |e|
              @payment_products << OnlinePayments::SDK::Domain::PaymentProduct.new_from_hash(e)
            end
          end
        end
      end
    end
  end
end
