#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] account_id
    # @attr [String] company_name
    # @attr [String] country_code
    # @attr [String] customer_account_status
    # @attr [String] customer_address_status
    # @attr [String] first_name
    # @attr [String] payer_id
    # @attr [String] surname
    class PaymentProduct840CustomerAccount < OnlinePayments::SDK::DataObject
      attr_accessor :account_id
      attr_accessor :company_name
      attr_accessor :country_code
      attr_accessor :customer_account_status
      attr_accessor :customer_address_status
      attr_accessor :first_name
      attr_accessor :payer_id
      attr_accessor :surname

      # @return (Hash)
      def to_h
        hash = super
        hash['accountId'] = @account_id unless @account_id.nil?
        hash['companyName'] = @company_name unless @company_name.nil?
        hash['countryCode'] = @country_code unless @country_code.nil?
        hash['customerAccountStatus'] = @customer_account_status unless @customer_account_status.nil?
        hash['customerAddressStatus'] = @customer_address_status unless @customer_address_status.nil?
        hash['firstName'] = @first_name unless @first_name.nil?
        hash['payerId'] = @payer_id unless @payer_id.nil?
        hash['surname'] = @surname unless @surname.nil?
        hash
      end

      def from_hash(hash)
        super
        @account_id = hash['accountId'] if hash.key? 'accountId'
        @company_name = hash['companyName'] if hash.key? 'companyName'
        @country_code = hash['countryCode'] if hash.key? 'countryCode'
        @customer_account_status = hash['customerAccountStatus'] if hash.key? 'customerAccountStatus'
        @customer_address_status = hash['customerAddressStatus'] if hash.key? 'customerAddressStatus'
        @first_name = hash['firstName'] if hash.key? 'firstName'
        @payer_id = hash['payerId'] if hash.key? 'payerId'
        @surname = hash['surname'] if hash.key? 'surname'
      end
    end
  end
end
