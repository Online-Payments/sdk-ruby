# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_filter'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFilter, nil] exclude
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFilter, nil] restrict_to
      class PaymentProductFiltersHostedCheckout < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :exclude

        attr_accessor :restrict_to

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(exclude: nil, restrict_to: nil)
          super()
          @exclude = exclude
          @restrict_to = restrict_to
        end

        # Sets the property and returns this same instance.
        def with_exclude(value)
          @exclude = value
          self
        end

        # Sets the property and returns this same instance.
        def with_restrict_to(value)
          @restrict_to = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['exclude'] = @exclude.to_h unless @exclude.nil?
          hash['restrictTo'] = @restrict_to.to_h unless @restrict_to.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'exclude'
            raise TypeError, "value '#{hash['exclude']}' is not a Hash" unless hash['exclude'].is_a? Hash
            @exclude = OnlinePayments::SDK::Domain::PaymentProductFilter.new_from_hash(hash['exclude'])
          end
          if hash.key? 'restrictTo'
            raise TypeError, "value '#{hash['restrictTo']}' is not a Hash" unless hash['restrictTo'].is_a? Hash
            @restrict_to = OnlinePayments::SDK::Domain::PaymentProductFilter.new_from_hash(hash['restrictTo'])
          end
        end
      end
    end
  end
end
