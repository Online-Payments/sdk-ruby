# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/api_parameters'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::ApiParameters, nil] api_parameters
      class PaymentProduct5002SpecificData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :api_parameters

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(api_parameters: nil)
          super()
          @api_parameters = api_parameters
        end

        # Sets the property and returns this same instance.
        def with_api_parameters(value)
          @api_parameters = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['apiParameters'] = @api_parameters.to_h unless @api_parameters.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'apiParameters'
            raise TypeError, "value '#{hash['apiParameters']}' is not a Hash" unless hash['apiParameters'].is_a? Hash
            @api_parameters = OnlinePayments::SDK::Domain::ApiParameters.new_from_hash(hash['apiParameters'])
          end
        end
      end
    end
  end
end
