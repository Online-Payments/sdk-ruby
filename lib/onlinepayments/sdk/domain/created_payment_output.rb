# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_response'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentResponse, nil] payment
      # @attr [String, nil] payment_status_category
      class CreatedPaymentOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment

        attr_accessor :payment_status_category

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(payment: nil, payment_status_category: nil)
          super()
          @payment = payment
          @payment_status_category = payment_status_category
        end

        # Sets the property and returns this same instance.
        def with_payment(value)
          @payment = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_status_category(value)
          @payment_status_category = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['payment'] = @payment.to_h unless @payment.nil?
          hash['paymentStatusCategory'] = @payment_status_category unless @payment_status_category.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'payment'
            raise TypeError, "value '#{hash['payment']}' is not a Hash" unless hash['payment'].is_a? Hash
            @payment = OnlinePayments::SDK::Domain::PaymentResponse.new_from_hash(hash['payment'])
          end
          if hash.key? 'paymentStatusCategory'
            @payment_status_category = hash['paymentStatusCategory']
          end
        end
      end
    end
  end
end
