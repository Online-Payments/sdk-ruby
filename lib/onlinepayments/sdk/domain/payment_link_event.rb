#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] date_time
    # @attr [String] details
    # @attr [String] type
    class PaymentLinkEvent < OnlinePayments::SDK::DataObject
      attr_accessor :date_time
      attr_accessor :details
      attr_accessor :type

      # @return (Hash)
      def to_h
        hash = super
        hash['dateTime'] = @date_time unless @date_time.nil?
        hash['details'] = @details unless @details.nil?
        hash['type'] = @type unless @type.nil?
        hash
      end

      def from_hash(hash)
        super
        @date_time = hash['dateTime'] if hash.key? 'dateTime'
        @details = hash['details'] if hash.key? 'details'
        @type = hash['type'] if hash.key? 'type'
      end
    end
  end
end
