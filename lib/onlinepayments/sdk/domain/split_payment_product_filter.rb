# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<Integer>, nil] products
      class SplitPaymentProductFilter < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :products

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(products: nil)
          super()
          @products = products
        end

        # Sets the property and returns this same instance.
        def with_products(value)
          @products = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['products'] = @products unless @products.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'products'
            raise TypeError, "value '#{hash['products']}' is not an Array" unless hash['products'].is_a? Array
            @products = []
            hash['products'].each do |e|
              @products << e
            end
          end
        end
      end
    end
  end
end
