# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] hosted_checkout_id
      # @attr [String, nil] variant
      class HostedCheckoutSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :hosted_checkout_id

        attr_accessor :variant

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(hosted_checkout_id: nil, variant: nil)
          super()
          @hosted_checkout_id = hosted_checkout_id
          @variant = variant
        end

        # Sets the property and returns this same instance.
        def with_hosted_checkout_id(value)
          @hosted_checkout_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_variant(value)
          @variant = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['hostedCheckoutId'] = @hosted_checkout_id unless @hosted_checkout_id.nil?
          hash['variant'] = @variant unless @variant.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'hostedCheckoutId'
            @hosted_checkout_id = hash['hostedCheckoutId']
          end
          if hash.key? 'variant'
            @variant = hash['variant']
          end
        end
      end
    end
  end
end
