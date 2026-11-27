# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] exemption_request
      # @attr [String, nil] subsequent_type
      class RedirectPaymentProduct5001SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :exemption_request

        attr_accessor :subsequent_type

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(exemption_request: nil, subsequent_type: nil)
          super()
          @exemption_request = exemption_request
          @subsequent_type = subsequent_type
        end

        # Sets the property and returns this same instance.
        def with_exemption_request(value)
          @exemption_request = value
          self
        end

        # Sets the property and returns this same instance.
        def with_subsequent_type(value)
          @subsequent_type = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['exemptionRequest'] = @exemption_request unless @exemption_request.nil?
          hash['subsequentType'] = @subsequent_type unless @subsequent_type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'exemptionRequest'
            @exemption_request = hash['exemptionRequest']
          end
          if hash.key? 'subsequentType'
            @subsequent_type = hash['subsequentType']
          end
        end
      end
    end
  end
end
