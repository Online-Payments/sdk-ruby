#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] regular_expression
      class RegularExpressionValidator < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :regular_expression

        # @return (Hash)
        def to_h
          hash = super
          hash['regularExpression'] = @regular_expression unless @regular_expression.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'regularExpression'
            @regular_expression = hash['regularExpression']
          end
        end
      end
    end
  end
end
