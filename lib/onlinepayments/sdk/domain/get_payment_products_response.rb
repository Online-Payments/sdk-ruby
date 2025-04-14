#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::PaymentProduct>] payment_products
      class GetPaymentProductsResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_products

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentProducts'] = @payment_products.collect{|val| val.to_h} unless @payment_products.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentProducts'
            raise TypeError, "value '%s' is not an Array" % [hash['paymentProducts']] unless hash['paymentProducts'].is_a? Array
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
