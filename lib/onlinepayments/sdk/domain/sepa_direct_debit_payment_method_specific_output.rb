# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/fraud_results'
require 'onlinepayments/sdk/domain/payment_product771_specific_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::FraudResults, nil] fraud_results
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct771SpecificOutput, nil] payment_product771_specific_output
      # @attr [Integer, nil] payment_product_id
      class SepaDirectDebitPaymentMethodSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :fraud_results

        attr_accessor :payment_product771_specific_output

        attr_accessor :payment_product_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(fraud_results: nil, payment_product771_specific_output: nil, payment_product_id: nil)
          super()
          @fraud_results = fraud_results
          @payment_product771_specific_output = payment_product771_specific_output
          @payment_product_id = payment_product_id
        end

        # Sets the property and returns this same instance.
        def with_fraud_results(value)
          @fraud_results = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_product771_specific_output(value)
          @payment_product771_specific_output = value
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
          hash['fraudResults'] = @fraud_results.to_h unless @fraud_results.nil?
          hash['paymentProduct771SpecificOutput'] = @payment_product771_specific_output.to_h unless @payment_product771_specific_output.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'fraudResults'
            raise TypeError, "value '#{hash['fraudResults']}' is not a Hash" unless hash['fraudResults'].is_a? Hash
            @fraud_results = OnlinePayments::SDK::Domain::FraudResults.new_from_hash(hash['fraudResults'])
          end
          if hash.key? 'paymentProduct771SpecificOutput'
            raise TypeError, "value '#{hash['paymentProduct771SpecificOutput']}' is not a Hash" unless hash['paymentProduct771SpecificOutput'].is_a? Hash
            @payment_product771_specific_output = OnlinePayments::SDK::Domain::PaymentProduct771SpecificOutput.new_from_hash(hash['paymentProduct771SpecificOutput'])
          end
          if hash.key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
        end
      end
    end
  end
end
