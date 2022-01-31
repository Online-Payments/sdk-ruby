#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/address'
require 'onlinepayments/sdk/domain/company_information'
require 'onlinepayments/sdk/domain/contact_details'
require 'onlinepayments/sdk/domain/customer_account'
require 'onlinepayments/sdk/domain/customer_device'
require 'onlinepayments/sdk/domain/personal_information'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::CustomerAccount] account
    # @attr [String] account_type
    # @attr [OnlinePayments::SDK::Domain::Address] billing_address
    # @attr [OnlinePayments::SDK::Domain::CompanyInformation] company_information
    # @attr [OnlinePayments::SDK::Domain::ContactDetails] contact_details
    # @attr [OnlinePayments::SDK::Domain::CustomerDevice] device
    # @attr [String] fiscal_number
    # @attr [String] locale
    # @attr [String] merchant_customer_id
    # @attr [OnlinePayments::SDK::Domain::PersonalInformation] personal_information
    class Customer < OnlinePayments::SDK::DataObject
      attr_accessor :account
      attr_accessor :account_type
      attr_accessor :billing_address
      attr_accessor :company_information
      attr_accessor :contact_details
      attr_accessor :device
      attr_accessor :fiscal_number
      attr_accessor :locale
      attr_accessor :merchant_customer_id
      attr_accessor :personal_information

      # @return (Hash)
      def to_h
        hash = super
        hash['account'] = @account.to_h if @account
        hash['accountType'] = @account_type unless @account_type.nil?
        hash['billingAddress'] = @billing_address.to_h if @billing_address
        hash['companyInformation'] = @company_information.to_h if @company_information
        hash['contactDetails'] = @contact_details.to_h if @contact_details
        hash['device'] = @device.to_h if @device
        hash['fiscalNumber'] = @fiscal_number unless @fiscal_number.nil?
        hash['locale'] = @locale unless @locale.nil?
        hash['merchantCustomerId'] = @merchant_customer_id unless @merchant_customer_id.nil?
        hash['personalInformation'] = @personal_information.to_h if @personal_information
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'account'
          raise TypeError, "value '%s' is not a Hash" % [hash['account']] unless hash['account'].is_a? Hash
          @account = OnlinePayments::SDK::Domain::CustomerAccount.new_from_hash(hash['account'])
        end
        @account_type = hash['accountType'] if hash.key? 'accountType'
        if hash.key? 'billingAddress'
          raise TypeError, "value '%s' is not a Hash" % [hash['billingAddress']] unless hash['billingAddress'].is_a? Hash
          @billing_address = OnlinePayments::SDK::Domain::Address.new_from_hash(hash['billingAddress'])
        end
        if hash.key? 'companyInformation'
          raise TypeError, "value '%s' is not a Hash" % [hash['companyInformation']] unless hash['companyInformation'].is_a? Hash
          @company_information = OnlinePayments::SDK::Domain::CompanyInformation.new_from_hash(hash['companyInformation'])
        end
        if hash.key? 'contactDetails'
          raise TypeError, "value '%s' is not a Hash" % [hash['contactDetails']] unless hash['contactDetails'].is_a? Hash
          @contact_details = OnlinePayments::SDK::Domain::ContactDetails.new_from_hash(hash['contactDetails'])
        end
        if hash.key? 'device'
          raise TypeError, "value '%s' is not a Hash" % [hash['device']] unless hash['device'].is_a? Hash
          @device = OnlinePayments::SDK::Domain::CustomerDevice.new_from_hash(hash['device'])
        end
        @fiscal_number = hash['fiscalNumber'] if hash.key? 'fiscalNumber'
        @locale = hash['locale'] if hash.key? 'locale'
        @merchant_customer_id = hash['merchantCustomerId'] if hash.key? 'merchantCustomerId'
        if hash.key? 'personalInformation'
          raise TypeError, "value '%s' is not a Hash" % [hash['personalInformation']] unless hash['personalInformation'].is_a? Hash
          @personal_information = OnlinePayments::SDK::Domain::PersonalInformation.new_from_hash(hash['personalInformation'])
        end
      end
    end
  end
end
