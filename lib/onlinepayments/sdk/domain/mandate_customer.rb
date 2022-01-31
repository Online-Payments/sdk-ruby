#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/bank_account_iban'
require 'onlinepayments/sdk/domain/mandate_address'
require 'onlinepayments/sdk/domain/mandate_contact_details'
require 'onlinepayments/sdk/domain/mandate_personal_information'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::BankAccountIban] bank_account_iban
    # @attr [String] company_name
    # @attr [OnlinePayments::SDK::Domain::MandateContactDetails] contact_details
    # @attr [OnlinePayments::SDK::Domain::MandateAddress] mandate_address
    # @attr [OnlinePayments::SDK::Domain::MandatePersonalInformation] personal_information
    class MandateCustomer < OnlinePayments::SDK::DataObject
      attr_accessor :bank_account_iban
      attr_accessor :company_name
      attr_accessor :contact_details
      attr_accessor :mandate_address
      attr_accessor :personal_information

      # @return (Hash)
      def to_h
        hash = super
        hash['bankAccountIban'] = @bank_account_iban.to_h if @bank_account_iban
        hash['companyName'] = @company_name unless @company_name.nil?
        hash['contactDetails'] = @contact_details.to_h if @contact_details
        hash['mandateAddress'] = @mandate_address.to_h if @mandate_address
        hash['personalInformation'] = @personal_information.to_h if @personal_information
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'bankAccountIban'
          raise TypeError, "value '%s' is not a Hash" % [hash['bankAccountIban']] unless hash['bankAccountIban'].is_a? Hash
          @bank_account_iban = OnlinePayments::SDK::Domain::BankAccountIban.new_from_hash(hash['bankAccountIban'])
        end
        @company_name = hash['companyName'] if hash.key? 'companyName'
        if hash.key? 'contactDetails'
          raise TypeError, "value '%s' is not a Hash" % [hash['contactDetails']] unless hash['contactDetails'].is_a? Hash
          @contact_details = OnlinePayments::SDK::Domain::MandateContactDetails.new_from_hash(hash['contactDetails'])
        end
        if hash.key? 'mandateAddress'
          raise TypeError, "value '%s' is not a Hash" % [hash['mandateAddress']] unless hash['mandateAddress'].is_a? Hash
          @mandate_address = OnlinePayments::SDK::Domain::MandateAddress.new_from_hash(hash['mandateAddress'])
        end
        if hash.key? 'personalInformation'
          raise TypeError, "value '%s' is not a Hash" % [hash['personalInformation']] unless hash['personalInformation'].is_a? Hash
          @personal_information = OnlinePayments::SDK::Domain::MandatePersonalInformation.new_from_hash(hash['personalInformation'])
        end
      end
    end
  end
end
