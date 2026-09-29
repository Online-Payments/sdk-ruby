#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] checkout_type
      class RedirectPaymentProduct3203SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :checkout_type

        # Sets the property and returns this same instance.
        def with_checkout_type(value)
          @checkout_type = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['checkoutType'] = @checkout_type unless @checkout_type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'checkoutType'
            @checkout_type = hash['checkoutType']
          end
        end
      end
    end
  end
end
