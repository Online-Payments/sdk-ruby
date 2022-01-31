#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/customer_account_authentication'
require 'onlinepayments/sdk/domain/customer_payment_activity'
require 'onlinepayments/sdk/domain/payment_account_on_file'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::CustomerAccountAuthentication] authentication
    # @attr [String] change_date
    # @attr [true/false] changed_during_checkout
    # @attr [String] create_date
    # @attr [true/false] had_suspicious_activity
    # @attr [String] password_change_date
    # @attr [true/false] password_changed_during_checkout
    # @attr [OnlinePayments::SDK::Domain::PaymentAccountOnFile] payment_account_on_file
    # @attr [OnlinePayments::SDK::Domain::CustomerPaymentActivity] payment_activity
    class CustomerAccount < OnlinePayments::SDK::DataObject
      attr_accessor :authentication
      attr_accessor :change_date
      attr_accessor :changed_during_checkout
      attr_accessor :create_date
      attr_accessor :had_suspicious_activity
      attr_accessor :password_change_date
      attr_accessor :password_changed_during_checkout
      attr_accessor :payment_account_on_file
      attr_accessor :payment_activity

      # @return (Hash)
      def to_h
        hash = super
        hash['authentication'] = @authentication.to_h if @authentication
        hash['changeDate'] = @change_date unless @change_date.nil?
        hash['changedDuringCheckout'] = @changed_during_checkout unless @changed_during_checkout.nil?
        hash['createDate'] = @create_date unless @create_date.nil?
        hash['hadSuspiciousActivity'] = @had_suspicious_activity unless @had_suspicious_activity.nil?
        hash['passwordChangeDate'] = @password_change_date unless @password_change_date.nil?
        hash['passwordChangedDuringCheckout'] = @password_changed_during_checkout unless @password_changed_during_checkout.nil?
        hash['paymentAccountOnFile'] = @payment_account_on_file.to_h if @payment_account_on_file
        hash['paymentActivity'] = @payment_activity.to_h if @payment_activity
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'authentication'
          raise TypeError, "value '%s' is not a Hash" % [hash['authentication']] unless hash['authentication'].is_a? Hash
          @authentication = OnlinePayments::SDK::Domain::CustomerAccountAuthentication.new_from_hash(hash['authentication'])
        end
        @change_date = hash['changeDate'] if hash.key? 'changeDate'
        @changed_during_checkout = hash['changedDuringCheckout'] if hash.key? 'changedDuringCheckout'
        @create_date = hash['createDate'] if hash.key? 'createDate'
        @had_suspicious_activity = hash['hadSuspiciousActivity'] if hash.key? 'hadSuspiciousActivity'
        @password_change_date = hash['passwordChangeDate'] if hash.key? 'passwordChangeDate'
        @password_changed_during_checkout = hash['passwordChangedDuringCheckout'] if hash.key? 'passwordChangedDuringCheckout'
        if hash.key? 'paymentAccountOnFile'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentAccountOnFile']] unless hash['paymentAccountOnFile'].is_a? Hash
          @payment_account_on_file = OnlinePayments::SDK::Domain::PaymentAccountOnFile.new_from_hash(hash['paymentAccountOnFile'])
        end
        if hash.key? 'paymentActivity'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentActivity']] unless hash['paymentActivity'].is_a? Hash
          @payment_activity = OnlinePayments::SDK::Domain::CustomerPaymentActivity.new_from_hash(hash['paymentActivity'])
        end
      end
    end
  end
end
