#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/refund_payment_product840_customer_account'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::RefundPaymentProduct840CustomerAccount] customer_account
      class RefundPaymentProduct840SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :customer_account

        # @return (Hash)
        def to_h
          hash = super
          hash['customerAccount'] = @customer_account.to_h unless @customer_account.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'customerAccount'
            raise TypeError, "value '%s' is not a Hash" % [hash['customerAccount']] unless hash['customerAccount'].is_a? Hash
            @customer_account = OnlinePayments::SDK::Domain::RefundPaymentProduct840CustomerAccount.new_from_hash(hash['customerAccount'])
          end
        end
      end
    end
  end
end
