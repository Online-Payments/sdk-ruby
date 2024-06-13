#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] subsequent_type
    class RedirectPaymentProduct5001SpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :subsequent_type

      # @return (Hash)
      def to_h
        hash = super
        hash['subsequentType'] = @subsequent_type unless @subsequent_type.nil?
        hash
      end

      def from_hash(hash)
        super
        @subsequent_type = hash['subsequentType'] if hash.key? 'subsequentType'
      end
    end
  end
end
