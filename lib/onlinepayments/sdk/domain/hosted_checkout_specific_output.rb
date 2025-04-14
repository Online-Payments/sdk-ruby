#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] hosted_checkout_id
      # @attr [String] variant
      class HostedCheckoutSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :hosted_checkout_id

        attr_accessor :variant

        # @return (Hash)
        def to_h
          hash = super
          hash['hostedCheckoutId'] = @hosted_checkout_id unless @hosted_checkout_id.nil?
          hash['variant'] = @variant unless @variant.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'hostedCheckoutId'
            @hosted_checkout_id = hash['hostedCheckoutId']
          end
          if hash.has_key? 'variant'
            @variant = hash['variant']
          end
        end
      end
    end
  end
end
