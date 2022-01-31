#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/address'
require 'onlinepayments/sdk/domain/company_information'
require 'onlinepayments/sdk/domain/personal_information_token'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::Address] billing_address
    # @attr [OnlinePayments::SDK::Domain::CompanyInformation] company_information
    # @attr [OnlinePayments::SDK::Domain::PersonalInformationToken] personal_information
    class CustomerToken < OnlinePayments::SDK::DataObject
      attr_accessor :billing_address
      attr_accessor :company_information
      attr_accessor :personal_information

      # @return (Hash)
      def to_h
        hash = super
        hash['billingAddress'] = @billing_address.to_h if @billing_address
        hash['companyInformation'] = @company_information.to_h if @company_information
        hash['personalInformation'] = @personal_information.to_h if @personal_information
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'billingAddress'
          raise TypeError, "value '%s' is not a Hash" % [hash['billingAddress']] unless hash['billingAddress'].is_a? Hash
          @billing_address = OnlinePayments::SDK::Domain::Address.new_from_hash(hash['billingAddress'])
        end
        if hash.key? 'companyInformation'
          raise TypeError, "value '%s' is not a Hash" % [hash['companyInformation']] unless hash['companyInformation'].is_a? Hash
          @company_information = OnlinePayments::SDK::Domain::CompanyInformation.new_from_hash(hash['companyInformation'])
        end
        if hash.key? 'personalInformation'
          raise TypeError, "value '%s' is not a Hash" % [hash['personalInformation']] unless hash['personalInformation'].is_a? Hash
          @personal_information = OnlinePayments::SDK::Domain::PersonalInformationToken.new_from_hash(hash['personalInformation'])
        end
      end
    end
  end
end
