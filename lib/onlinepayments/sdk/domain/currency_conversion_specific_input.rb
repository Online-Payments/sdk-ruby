# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] dcc_enabled
      class CurrencyConversionSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :dcc_enabled

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(dcc_enabled: nil)
          super()
          @dcc_enabled = dcc_enabled
        end

        # Sets the property and returns this same instance.
        def with_dcc_enabled(value)
          @dcc_enabled = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['dccEnabled'] = @dcc_enabled unless @dcc_enabled.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'dccEnabled'
            @dcc_enabled = hash['dccEnabled']
          end
        end
      end
    end
  end
end
