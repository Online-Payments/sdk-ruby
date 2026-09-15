#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] checkout_response_signature
      # @attr [String, nil] credit_card_brand
      class PaymentProduct5002SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :checkout_response_signature

        attr_accessor :credit_card_brand

        # @return (Hash)
        def to_h
          hash = super
          hash['checkoutResponseSignature'] = @checkout_response_signature unless @checkout_response_signature.nil?
          hash['creditCardBrand'] = @credit_card_brand unless @credit_card_brand.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'checkoutResponseSignature'
            @checkout_response_signature = hash['checkoutResponseSignature']
          end
          if hash.has_key? 'creditCardBrand'
            @credit_card_brand = hash['creditCardBrand']
          end
        end
      end
    end
  end
end
