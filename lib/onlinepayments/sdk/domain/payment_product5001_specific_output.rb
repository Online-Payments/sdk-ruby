#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] authorisation_code
    class PaymentProduct5001SpecificOutput < OnlinePayments::SDK::DataObject
      attr_accessor :authorisation_code

      # @return (Hash)
      def to_h
        hash = super
        hash['authorisationCode'] = @authorisation_code unless @authorisation_code.nil?
        hash
      end

      def from_hash(hash)
        super
        @authorisation_code = hash['authorisationCode'] if hash.key? 'authorisationCode'
      end
    end
  end
end
