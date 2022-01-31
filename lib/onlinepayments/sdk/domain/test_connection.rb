#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] result
    class TestConnection < OnlinePayments::SDK::DataObject
      attr_accessor :result

      # @return (Hash)
      def to_h
        hash = super
        hash['result'] = @result unless @result.nil?
        hash
      end

      def from_hash(hash)
        super
        @result = hash['result'] if hash.key? 'result'
      end
    end
  end
end
