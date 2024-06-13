#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] description
    # @attr [String] expiration_date
    # @attr [String] recipient_name
    class PaymentLinkSpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :description
      attr_accessor :expiration_date
      attr_accessor :recipient_name

      # @return (Hash)
      def to_h
        hash = super
        hash['description'] = @description unless @description.nil?
        hash['expirationDate'] = @expiration_date unless @expiration_date.nil?
        hash['recipientName'] = @recipient_name unless @recipient_name.nil?
        hash
      end

      def from_hash(hash)
        super
        @description = hash['description'] if hash.key? 'description'
        @expiration_date = hash['expirationDate'] if hash.key? 'expirationDate'
        @recipient_name = hash['recipientName'] if hash.key? 'recipientName'
      end
    end
  end
end
