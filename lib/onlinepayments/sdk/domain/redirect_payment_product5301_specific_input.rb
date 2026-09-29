#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] payment_method_type
      class RedirectPaymentProduct5301SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_method_type

        # Sets the property and returns this same instance.
        def with_payment_method_type(value)
          @payment_method_type = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentMethodType'] = @payment_method_type unless @payment_method_type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentMethodType'
            @payment_method_type = hash['paymentMethodType']
          end
        end
      end
    end
  end
end
