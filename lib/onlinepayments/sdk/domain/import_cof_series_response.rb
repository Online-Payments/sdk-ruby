# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] payment_id
      class ImportCofSeriesResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(payment_id: nil)
          super()
          @payment_id = payment_id
        end

        # Sets the property and returns this same instance.
        def with_payment_id(value)
          @payment_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentId'] = @payment_id unless @payment_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'paymentId'
            @payment_id = hash['paymentId']
          end
        end
      end
    end
  end
end
