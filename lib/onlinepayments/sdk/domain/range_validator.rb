# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] max_value
      # @attr [Integer, nil] min_value
      class RangeValidator < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :max_value

        attr_accessor :min_value

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(max_value: nil, min_value: nil)
          super()
          @max_value = max_value
          @min_value = min_value
        end

        # Sets the property and returns this same instance.
        def with_max_value(value)
          @max_value = value
          self
        end

        # Sets the property and returns this same instance.
        def with_min_value(value)
          @min_value = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['maxValue'] = @max_value unless @max_value.nil?
          hash['minValue'] = @min_value unless @min_value.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'maxValue'
            @max_value = hash['maxValue']
          end
          if hash.key? 'minValue'
            @min_value = hash['minValue']
          end
        end
      end
    end
  end
end
