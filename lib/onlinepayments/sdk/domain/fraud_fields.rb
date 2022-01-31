#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] black_list_data
    # @attr [String] customer_ip_address
    class FraudFields < OnlinePayments::SDK::DataObject
      attr_accessor :black_list_data
      attr_accessor :customer_ip_address

      # @return (Hash)
      def to_h
        hash = super
        hash['blackListData'] = @black_list_data unless @black_list_data.nil?
        hash['customerIpAddress'] = @customer_ip_address unless @customer_ip_address.nil?
        hash
      end

      def from_hash(hash)
        super
        @black_list_data = hash['blackListData'] if hash.key? 'blackListData'
        @customer_ip_address = hash['customerIpAddress'] if hash.key? 'customerIpAddress'
      end
    end
  end
end
