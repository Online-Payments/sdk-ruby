#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] dpan
    # @attr [String] expiry_date
    class MobilePaymentData < OnlinePayments::SDK::DataObject
      attr_accessor :dpan
      attr_accessor :expiry_date

      # @return (Hash)
      def to_h
        hash = super
        hash['dpan'] = @dpan unless @dpan.nil?
        hash['expiryDate'] = @expiry_date unless @expiry_date.nil?
        hash
      end

      def from_hash(hash)
        super
        @dpan = hash['dpan'] if hash.key? 'dpan'
        @expiry_date = hash['expiryDate'] if hash.key? 'expiryDate'
      end
    end
  end
end
