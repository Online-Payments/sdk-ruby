#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] regular_expression
    class RegularExpressionValidator < OnlinePayments::SDK::DataObject
      attr_accessor :regular_expression

      # @return (Hash)
      def to_h
        hash = super
        hash['regularExpression'] = @regular_expression unless @regular_expression.nil?
        hash
      end

      def from_hash(hash)
        super
        @regular_expression = hash['regularExpression'] if hash.key? 'regularExpression'
      end
    end
  end
end
