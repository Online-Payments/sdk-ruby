#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] customer_account_status
      # @attr [String] customer_address_status
      # @attr [String] payer_id
      class RefundPaymentProduct840CustomerAccount < OnlinePayments::SDK::Domain::DataObject

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
          if hash.has_key? 'customerAccountStatus'
            @customer_account_status = hash['customerAccountStatus']
          end
          if hash.has_key? 'customerAddressStatus'
            @customer_address_status = hash['customerAddressStatus']
          end
          if hash.has_key? 'payerId'
            @payer_id = hash['payerId']
          end
        end
      end
    end
  end
end
