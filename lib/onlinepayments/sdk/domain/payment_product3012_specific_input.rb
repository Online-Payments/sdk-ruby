#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [true/false] force_authentication
    # @attr [true/false] is_deferred_payment
    # @attr [true/false] is_wip_transaction
    # @attr [String] wip_merchant_authentication_method
    class PaymentProduct3012SpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :force_authentication
      attr_accessor :is_deferred_payment
      attr_accessor :is_wip_transaction
      attr_accessor :wip_merchant_authentication_method

      # @return (Hash)
      def to_h
        hash = super
        hash['forceAuthentication'] = @force_authentication unless @force_authentication.nil?
        hash['isDeferredPayment'] = @is_deferred_payment unless @is_deferred_payment.nil?
        hash['isWipTransaction'] = @is_wip_transaction unless @is_wip_transaction.nil?
        hash['wipMerchantAuthenticationMethod'] = @wip_merchant_authentication_method unless @wip_merchant_authentication_method.nil?
        hash
      end

      def from_hash(hash)
        super
        @force_authentication = hash['forceAuthentication'] if hash.key? 'forceAuthentication'
        @is_deferred_payment = hash['isDeferredPayment'] if hash.key? 'isDeferredPayment'
        @is_wip_transaction = hash['isWipTransaction'] if hash.key? 'isWipTransaction'
        @wip_merchant_authentication_method = hash['wipMerchantAuthenticationMethod'] if hash.key? 'wipMerchantAuthenticationMethod'
      end
    end
  end
end
