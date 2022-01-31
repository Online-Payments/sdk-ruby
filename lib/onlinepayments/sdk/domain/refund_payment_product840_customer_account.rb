#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] customer_account_status
    # @attr [String] customer_address_status
    # @attr [String] payer_id
    class RefundPaymentProduct840CustomerAccount < OnlinePayments::SDK::DataObject
      attr_accessor :customer_account_status
      attr_accessor :customer_address_status
      attr_accessor :payer_id

      # @return (Hash)
      def to_h
        hash = super
        hash['customerAccountStatus'] = @customer_account_status unless @customer_account_status.nil?
        hash['customerAddressStatus'] = @customer_address_status unless @customer_address_status.nil?
        hash['payerId'] = @payer_id unless @payer_id.nil?
        hash
      end

      def from_hash(hash)
        super
        @customer_account_status = hash['customerAccountStatus'] if hash.key? 'customerAccountStatus'
        @customer_address_status = hash['customerAddressStatus'] if hash.key? 'customerAddressStatus'
        @payer_id = hash['payerId'] if hash.key? 'payerId'
      end
    end
  end
end
