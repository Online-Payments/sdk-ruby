#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/sepa_direct_debit_payment_product771_specific_input'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::SepaDirectDebitPaymentProduct771SpecificInput] payment_product771_specific_input
      # @attr [Integer] payment_product_id
      class SepaDirectDebitPaymentMethodSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_product771_specific_input

        attr_accessor :payment_product_id

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentProduct771SpecificInput'] = @payment_product771_specific_input.to_h unless @payment_product771_specific_input.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentProduct771SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct771SpecificInput']] unless hash['paymentProduct771SpecificInput'].is_a? Hash
            @payment_product771_specific_input = OnlinePayments::SDK::Domain::SepaDirectDebitPaymentProduct771SpecificInput.new_from_hash(hash['paymentProduct771SpecificInput'])
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
        end
      end
    end
  end
end
