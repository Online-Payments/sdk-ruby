# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] adjustable_amount
      # @attr [String, nil] beneficiary_id
      class RedirectPaymentProduct5412SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :adjustable_amount

        attr_accessor :beneficiary_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(adjustable_amount: nil, beneficiary_id: nil)
          super()
          @adjustable_amount = adjustable_amount
          @beneficiary_id = beneficiary_id
        end

        # Sets the property and returns this same instance.
        def with_adjustable_amount(value)
          @adjustable_amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_beneficiary_id(value)
          @beneficiary_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['adjustableAmount'] = @adjustable_amount unless @adjustable_amount.nil?
          hash['beneficiaryId'] = @beneficiary_id unless @beneficiary_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'adjustableAmount'
            @adjustable_amount = hash['adjustableAmount']
          end
          if hash.key? 'beneficiaryId'
            @beneficiary_id = hash['beneficiaryId']
          end
        end
      end
    end
  end
end
