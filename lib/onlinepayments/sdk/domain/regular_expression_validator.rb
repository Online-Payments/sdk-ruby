# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] regular_expression
      class RegularExpressionValidator < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :regular_expression

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(regular_expression: nil)
          super()
          @regular_expression = regular_expression
        end

        # Sets the property and returns this same instance.
        def with_regular_expression(value)
          @regular_expression = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['regularExpression'] = @regular_expression unless @regular_expression.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'regularExpression'
            @regular_expression = hash['regularExpression']
          end
        end
      end
    end
  end
end
