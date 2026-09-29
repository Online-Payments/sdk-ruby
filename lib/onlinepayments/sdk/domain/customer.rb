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
      # @attr [OnlinePayments::SDK::Domain::CustomerAccount, nil] account
      # @attr [String, nil] account_type
      # @attr [OnlinePayments::SDK::Domain::Address, nil] billing_address
      # @attr [OnlinePayments::SDK::Domain::CompanyInformation, nil] company_information
      # @attr [OnlinePayments::SDK::Domain::ContactDetails, nil] contact_details
      # @attr [OnlinePayments::SDK::Domain::CustomerDevice, nil] device
      # @attr [String, nil] fiscal_number
      # @attr [String, nil] locale
      # @attr [String, nil] merchant_customer_id
      # @attr [OnlinePayments::SDK::Domain::PersonalInformation, nil] personal_information
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

        # Sets the property and returns this same instance.
        def with_account(value)
          @account = value
          self
        end

        # Sets the property and returns this same instance.
        def with_account_type(value)
          @account_type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_billing_address(value)
          @billing_address = value
          self
        end

        # Sets the property and returns this same instance.
        def with_company_information(value)
          @company_information = value
          self
        end

        # Sets the property and returns this same instance.
        def with_contact_details(value)
          @contact_details = value
          self
        end

        # Sets the property and returns this same instance.
        def with_device(value)
          @device = value
          self
        end

        # Sets the property and returns this same instance.
        def with_fiscal_number(value)
          @fiscal_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_locale(value)
          @locale = value
          self
        end

        # Sets the property and returns this same instance.
        def with_merchant_customer_id(value)
          @merchant_customer_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_personal_information(value)
          @personal_information = value
          self
        end

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
