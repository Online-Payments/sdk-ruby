#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/refund_payment_product840_customer_account'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::RefundPaymentProduct840CustomerAccount] customer_account
    class RefundPaymentProduct840SpecificOutput < OnlinePayments::SDK::DataObject
      attr_accessor :customer_account

      # @return (Hash)
      def to_h
        hash = super
        hash['customerAccount'] = @customer_account.to_h if @customer_account
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'customerAccount'
          raise TypeError, "value '%s' is not a Hash" % [hash['customerAccount']] unless hash['customerAccount'].is_a? Hash
          @customer_account = OnlinePayments::SDK::Domain::RefundPaymentProduct840CustomerAccount.new_from_hash(hash['customerAccount'])
        end
      end
    end
  end
end
