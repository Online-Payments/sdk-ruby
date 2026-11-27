# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_context'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] bin
      # @attr [OnlinePayments::SDK::Domain::PaymentContext, nil] payment_context
      class GetIINDetailsRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :bin

        attr_accessor :payment_context

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(bin: nil, payment_context: nil)
          super()
          @bin = bin
          @payment_context = payment_context
        end

        # Sets the property and returns this same instance.
        def with_bin(value)
          @bin = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_context(value)
          @payment_context = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['bin'] = @bin unless @bin.nil?
          hash['paymentContext'] = @payment_context.to_h unless @payment_context.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'bin'
            @bin = hash['bin']
          end
          if hash.key? 'paymentContext'
            raise TypeError, "value '#{hash['paymentContext']}' is not a Hash" unless hash['paymentContext'].is_a? Hash
            @payment_context = OnlinePayments::SDK::Domain::PaymentContext.new_from_hash(hash['paymentContext'])
          end
        end
      end
    end
  end
end
