#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] email_address
    class MandateContactDetails < OnlinePayments::SDK::DataObject
      attr_accessor :email_address

      # @return (Hash)
      def to_h
        hash = super
        hash['emailAddress'] = @email_address unless @email_address.nil?
        hash
      end

      def from_hash(hash)
        super
        @email_address = hash['emailAddress'] if hash.key? 'emailAddress'
      end
    end
  end
end
