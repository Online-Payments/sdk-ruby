#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] customer_account_status
      # @attr [String, nil] customer_address_status
      # @attr [String, nil] payer_id
      class RefundPaymentProduct840CustomerAccount < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :customer_account_status

        attr_accessor :customer_address_status

        attr_accessor :payer_id

        # Sets the property and returns this same instance.
        def with_customer_account_status(value)
          @customer_account_status = value
          self
        end

        # Sets the property and returns this same instance.
        def with_customer_address_status(value)
          @customer_address_status = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payer_id(value)
          @payer_id = value
          self
        end

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
