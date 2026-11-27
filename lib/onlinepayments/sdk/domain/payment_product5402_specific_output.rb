# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] brand
      class PaymentProduct5402SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :brand

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(brand: nil)
          super()
          @brand = brand
        end

        # Sets the property and returns this same instance.
        def with_brand(value)
          @brand = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['brand'] = @brand unless @brand.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'brand'
            @brand = hash['brand']
          end
        end
      end
    end
  end
end
