# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/sepa_direct_debit_payment_product771_specific_input_base'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::SepaDirectDebitPaymentProduct771SpecificInputBase, nil] payment_product771_specific_input
      # @attr [Integer, nil] payment_product_id
      class SepaDirectDebitPaymentMethodSpecificInputBase < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_product771_specific_input

        attr_accessor :payment_product_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(payment_product771_specific_input: nil, payment_product_id: nil)
          super()
          @payment_product771_specific_input = payment_product771_specific_input
          @payment_product_id = payment_product_id
        end

        # Sets the property and returns this same instance.
        def with_payment_product771_specific_input(value)
          @payment_product771_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_product_id(value)
          @payment_product_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentProduct771SpecificInput'] = @payment_product771_specific_input.to_h unless @payment_product771_specific_input.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'paymentProduct771SpecificInput'
            raise TypeError, "value '#{hash['paymentProduct771SpecificInput']}' is not a Hash" unless hash['paymentProduct771SpecificInput'].is_a? Hash
            @payment_product771_specific_input = OnlinePayments::SDK::Domain::SepaDirectDebitPaymentProduct771SpecificInputBase.new_from_hash(hash['paymentProduct771SpecificInput'])
          end
          if hash.key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
        end
      end
    end
  end
end
