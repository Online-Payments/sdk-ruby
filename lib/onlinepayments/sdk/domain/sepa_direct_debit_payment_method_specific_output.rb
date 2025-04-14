#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/fraud_results'
require 'onlinepayments/sdk/domain/payment_product771_specific_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::FraudResults] fraud_results
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct771SpecificOutput] payment_product771_specific_output
      # @attr [Integer] payment_product_id
      class SepaDirectDebitPaymentMethodSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :fraud_results

        attr_accessor :payment_product771_specific_output

        attr_accessor :payment_product_id

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
          if hash.has_key? 'fraudResults'
            raise TypeError, "value '%s' is not a Hash" % [hash['fraudResults']] unless hash['fraudResults'].is_a? Hash
            @fraud_results = OnlinePayments::SDK::Domain::FraudResults.new_from_hash(hash['fraudResults'])
          end
          if hash.has_key? 'paymentProduct771SpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct771SpecificOutput']] unless hash['paymentProduct771SpecificOutput'].is_a? Hash
            @payment_product771_specific_output = OnlinePayments::SDK::Domain::PaymentProduct771SpecificOutput.new_from_hash(hash['paymentProduct771SpecificOutput'])
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
        end
      end
    end
  end
end
