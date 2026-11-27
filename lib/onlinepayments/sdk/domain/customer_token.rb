# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/address'
require 'onlinepayments/sdk/domain/company_information'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/personal_information_token'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::Address, nil] billing_address
      # @attr [OnlinePayments::SDK::Domain::CompanyInformation, nil] company_information
      # @attr [OnlinePayments::SDK::Domain::PersonalInformationToken, nil] personal_information
      class CustomerToken < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :billing_address

        attr_accessor :company_information

        attr_accessor :personal_information

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(billing_address: nil, company_information: nil, personal_information: nil)
          super()
          @billing_address = billing_address
          @company_information = company_information
          @personal_information = personal_information
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
        def with_personal_information(value)
          @personal_information = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['billingAddress'] = @billing_address.to_h unless @billing_address.nil?
          hash['companyInformation'] = @company_information.to_h unless @company_information.nil?
          hash['personalInformation'] = @personal_information.to_h unless @personal_information.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'billingAddress'
            raise TypeError, "value '#{hash['billingAddress']}' is not a Hash" unless hash['billingAddress'].is_a? Hash
            @billing_address = OnlinePayments::SDK::Domain::Address.new_from_hash(hash['billingAddress'])
          end
          if hash.key? 'companyInformation'
            raise TypeError, "value '#{hash['companyInformation']}' is not a Hash" unless hash['companyInformation'].is_a? Hash
            @company_information = OnlinePayments::SDK::Domain::CompanyInformation.new_from_hash(hash['companyInformation'])
          end
          if hash.key? 'personalInformation'
            raise TypeError, "value '#{hash['personalInformation']}' is not a Hash" unless hash['personalInformation'].is_a? Hash
            @personal_information = OnlinePayments::SDK::Domain::PersonalInformationToken.new_from_hash(hash['personalInformation'])
          end
        end
      end
    end
  end
end
