# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] complete_remaining_payment_amount
      class RedirectPaymentProduct3103SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :complete_remaining_payment_amount

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(complete_remaining_payment_amount: nil)
          super()
          @complete_remaining_payment_amount = complete_remaining_payment_amount
        end

        # Sets the property and returns this same instance.
        def with_complete_remaining_payment_amount(value)
          @complete_remaining_payment_amount = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['completeRemainingPaymentAmount'] = @complete_remaining_payment_amount unless @complete_remaining_payment_amount.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'completeRemainingPaymentAmount'
            @complete_remaining_payment_amount = hash['completeRemainingPaymentAmount']
          end
        end
      end
    end
  end
end
