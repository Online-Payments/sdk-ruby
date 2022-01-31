#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] check_in_date
    class LodgingData < OnlinePayments::SDK::DataObject
      attr_accessor :check_in_date

      # @return (Hash)
      def to_h
        hash = super
        hash['checkInDate'] = @check_in_date unless @check_in_date.nil?
        hash
      end

      def from_hash(hash)
        super
        @check_in_date = hash['checkInDate'] if hash.key? 'checkInDate'
      end
    end
  end
end
