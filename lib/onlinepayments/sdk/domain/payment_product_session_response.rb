# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_session302_specific_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentProductSession302SpecificOutput, nil] payment_product_session302_specific_output
      class PaymentProductSessionResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_product_session302_specific_output

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(payment_product_session302_specific_output: nil)
          super()
          @payment_product_session302_specific_output = payment_product_session302_specific_output
        end

        # Sets the property and returns this same instance.
        def with_payment_product_session302_specific_output(value)
          @payment_product_session302_specific_output = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentProductSession302SpecificOutput'] = @payment_product_session302_specific_output.to_h unless @payment_product_session302_specific_output.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'paymentProductSession302SpecificOutput'
            raise TypeError, "value '#{hash['paymentProductSession302SpecificOutput']}' is not a Hash" unless hash['paymentProductSession302SpecificOutput'].is_a? Hash
            @payment_product_session302_specific_output = OnlinePayments::SDK::Domain::PaymentProductSession302SpecificOutput.new_from_hash(hash['paymentProductSession302SpecificOutput'])
          end
        end
      end
    end
  end
end
