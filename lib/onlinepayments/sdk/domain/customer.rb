#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/address'
require 'onlinepayments/sdk/domain/company_information'
require 'onlinepayments/sdk/domain/contact_details'
require 'onlinepayments/sdk/domain/customer_account'
require 'onlinepayments/sdk/domain/customer_device'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/personal_information'

module OnlinePayments
  module SDK
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
      class Customer < OnlinePayments::SDK::Domain::DataObject

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
          hash['account'] = @account.to_h unless @account.nil?
          hash['accountType'] = @account_type unless @account_type.nil?
          hash['billingAddress'] = @billing_address.to_h unless @billing_address.nil?
          hash['companyInformation'] = @company_information.to_h unless @company_information.nil?
          hash['contactDetails'] = @contact_details.to_h unless @contact_details.nil?
          hash['device'] = @device.to_h unless @device.nil?
          hash['fiscalNumber'] = @fiscal_number unless @fiscal_number.nil?
          hash['locale'] = @locale unless @locale.nil?
          hash['merchantCustomerId'] = @merchant_customer_id unless @merchant_customer_id.nil?
          hash['personalInformation'] = @personal_information.to_h unless @personal_information.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'account'
            raise TypeError, "value '%s' is not a Hash" % [hash['account']] unless hash['account'].is_a? Hash
            @account = OnlinePayments::SDK::Domain::CustomerAccount.new_from_hash(hash['account'])
          end
          if hash.has_key? 'accountType'
            @account_type = hash['accountType']
          end
          if hash.has_key? 'billingAddress'
            raise TypeError, "value '%s' is not a Hash" % [hash['billingAddress']] unless hash['billingAddress'].is_a? Hash
            @billing_address = OnlinePayments::SDK::Domain::Address.new_from_hash(hash['billingAddress'])
          end
          if hash.has_key? 'companyInformation'
            raise TypeError, "value '%s' is not a Hash" % [hash['companyInformation']] unless hash['companyInformation'].is_a? Hash
            @company_information = OnlinePayments::SDK::Domain::CompanyInformation.new_from_hash(hash['companyInformation'])
          end
          if hash.has_key? 'contactDetails'
            raise TypeError, "value '%s' is not a Hash" % [hash['contactDetails']] unless hash['contactDetails'].is_a? Hash
            @contact_details = OnlinePayments::SDK::Domain::ContactDetails.new_from_hash(hash['contactDetails'])
          end
          if hash.has_key? 'device'
            raise TypeError, "value '%s' is not a Hash" % [hash['device']] unless hash['device'].is_a? Hash
            @device = OnlinePayments::SDK::Domain::CustomerDevice.new_from_hash(hash['device'])
          end
          if hash.has_key? 'fiscalNumber'
            @fiscal_number = hash['fiscalNumber']
          end
          if hash.has_key? 'locale'
            @locale = hash['locale']
          end
          if hash.has_key? 'merchantCustomerId'
            @merchant_customer_id = hash['merchantCustomerId']
          end
          if hash.has_key? 'personalInformation'
            raise TypeError, "value '%s' is not a Hash" % [hash['personalInformation']] unless hash['personalInformation'].is_a? Hash
            @personal_information = OnlinePayments::SDK::Domain::PersonalInformation.new_from_hash(hash['personalInformation'])
          end
        end
      end
    end
  end
end
