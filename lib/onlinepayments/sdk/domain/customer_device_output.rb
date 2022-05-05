#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] ip_address_country_code
    class CustomerDeviceOutput < OnlinePayments::SDK::DataObject
      attr_accessor :ip_address_country_code

      # @return (Hash)
      def to_h
        hash = super
        hash['ipAddressCountryCode'] = @ip_address_country_code unless @ip_address_country_code.nil?
        hash
      end

      def from_hash(hash)
        super
        @ip_address_country_code = hash['ipAddressCountryCode'] if hash.key? 'ipAddressCountryCode'
      end
    end
  end
end
