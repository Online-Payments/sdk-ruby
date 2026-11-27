# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<String>, nil] groups
      # @attr [Array<Integer>, nil] products
      class PaymentProductFilter < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :groups

        attr_accessor :products

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(groups: nil, products: nil)
          super()
          @groups = groups
          @products = products
        end

        # Sets the property and returns this same instance.
        def with_groups(value)
          @groups = value
          self
        end

        # Sets the property and returns this same instance.
        def with_products(value)
          @products = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['groups'] = @groups unless @groups.nil?
          hash['products'] = @products unless @products.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'groups'
            raise TypeError, "value '#{hash['groups']}' is not an Array" unless hash['groups'].is_a? Array
            @groups = []
            hash['groups'].each do |e|
              @groups << e
            end
          end
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
