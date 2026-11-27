# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] fraud_service_result
      class FraudResults < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :fraud_service_result

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(fraud_service_result: nil)
          super()
          @fraud_service_result = fraud_service_result
        end

        # Sets the property and returns this same instance.
        def with_fraud_service_result(value)
          @fraud_service_result = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['fraudServiceResult'] = @fraud_service_result unless @fraud_service_result.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'fraudServiceResult'
            @fraud_service_result = hash['fraudServiceResult']
          end
        end
      end
    end
  end
end
