# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] max_length
      # @attr [Integer, nil] min_length
      class LengthValidator < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :max_length

        attr_accessor :min_length

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(max_length: nil, min_length: nil)
          super()
          @max_length = max_length
          @min_length = min_length
        end

        # Sets the property and returns this same instance.
        def with_max_length(value)
          @max_length = value
          self
        end

        # Sets the property and returns this same instance.
        def with_min_length(value)
          @min_length = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['maxLength'] = @max_length unless @max_length.nil?
          hash['minLength'] = @min_length unless @min_length.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'maxLength'
            @max_length = hash['maxLength']
          end
          if hash.key? 'minLength'
            @min_length = hash['minLength']
          end
        end
      end
    end
  end
end
