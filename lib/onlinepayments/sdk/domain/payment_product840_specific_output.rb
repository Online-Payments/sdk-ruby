#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/address'
require 'onlinepayments/sdk/domain/address_personal'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product840_customer_account'
require 'onlinepayments/sdk/domain/protection_eligibility'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::Address] billing_address
      # @attr [OnlinePayments::SDK::Domain::AddressPersonal] billing_personal_address
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct840CustomerAccount] customer_account
      # @attr [OnlinePayments::SDK::Domain::Address] customer_address
      # @attr [OnlinePayments::SDK::Domain::ProtectionEligibility] protection_eligibility
      class PaymentProduct840SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :billing_address

        attr_accessor :billing_personal_address

        attr_accessor :customer_account

        attr_accessor :customer_address

        attr_accessor :protection_eligibility

        # @return (Hash)
        def to_h
          hash = super
          hash['billingAddress'] = @billing_address.to_h unless @billing_address.nil?
          hash['billingPersonalAddress'] = @billing_personal_address.to_h unless @billing_personal_address.nil?
          hash['customerAccount'] = @customer_account.to_h unless @customer_account.nil?
          hash['customerAddress'] = @customer_address.to_h unless @customer_address.nil?
          hash['protectionEligibility'] = @protection_eligibility.to_h unless @protection_eligibility.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'billingAddress'
            raise TypeError, "value '%s' is not a Hash" % [hash['billingAddress']] unless hash['billingAddress'].is_a? Hash
            @billing_address = OnlinePayments::SDK::Domain::Address.new_from_hash(hash['billingAddress'])
          end
          if hash.has_key? 'billingPersonalAddress'
            raise TypeError, "value '%s' is not a Hash" % [hash['billingPersonalAddress']] unless hash['billingPersonalAddress'].is_a? Hash
            @billing_personal_address = OnlinePayments::SDK::Domain::AddressPersonal.new_from_hash(hash['billingPersonalAddress'])
          end
          if hash.has_key? 'customerAccount'
            raise TypeError, "value '%s' is not a Hash" % [hash['customerAccount']] unless hash['customerAccount'].is_a? Hash
            @customer_account = OnlinePayments::SDK::Domain::PaymentProduct840CustomerAccount.new_from_hash(hash['customerAccount'])
          end
          if hash.has_key? 'customerAddress'
            raise TypeError, "value '%s' is not a Hash" % [hash['customerAddress']] unless hash['customerAddress'].is_a? Hash
            @customer_address = OnlinePayments::SDK::Domain::Address.new_from_hash(hash['customerAddress'])
          end
          if hash.has_key? 'protectionEligibility'
            raise TypeError, "value '%s' is not a Hash" % [hash['protectionEligibility']] unless hash['protectionEligibility'].is_a? Hash
            @protection_eligibility = OnlinePayments::SDK::Domain::ProtectionEligibility.new_from_hash(hash['protectionEligibility'])
          end
        end
      end
    end
  end
end
