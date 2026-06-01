#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_session302_specific_input'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentProductSession302SpecificInput] payment_product_session302_specific_input
      class PaymentProductSessionRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_product_session302_specific_input

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentProductSession302SpecificInput'] = @payment_product_session302_specific_input.to_h unless @payment_product_session302_specific_input.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentProductSession302SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProductSession302SpecificInput']] unless hash['paymentProductSession302SpecificInput'].is_a? Hash
            @payment_product_session302_specific_input = OnlinePayments::SDK::Domain::PaymentProductSession302SpecificInput.new_from_hash(hash['paymentProductSession302SpecificInput'])
          end
        end
      end
    end
  end
end
