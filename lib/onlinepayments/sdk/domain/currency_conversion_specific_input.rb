#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [true/false] dcc_enabled
    class CurrencyConversionSpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :dcc_enabled

      # @return (Hash)
      def to_h
        hash = super
        hash['dccEnabled'] = @dcc_enabled unless @dcc_enabled.nil?
        hash
      end

      def from_hash(hash)
        super
        @dcc_enabled = hash['dccEnabled'] if hash.key? 'dccEnabled'
      end
    end
  end
end
