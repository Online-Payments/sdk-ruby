# frozen_string_literal: true

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
      # @attr [OnlinePayments::SDK::Domain::Address, nil] billing_address
      # @attr [OnlinePayments::SDK::Domain::AddressPersonal, nil] billing_personal_address
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct840CustomerAccount, nil] customer_account
      # @attr [OnlinePayments::SDK::Domain::Address, nil] customer_address
      # @attr [String, nil] pay_pal_transaction_id
      # @attr [OnlinePayments::SDK::Domain::ProtectionEligibility, nil] protection_eligibility
      # @attr [OnlinePayments::SDK::Domain::AddressPersonal, nil] shipping_address
      class PaymentProduct840SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :billing_address

        attr_accessor :billing_personal_address

        attr_accessor :customer_account

        attr_accessor :customer_address

        attr_accessor :pay_pal_transaction_id

        attr_accessor :protection_eligibility

        attr_accessor :shipping_address

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(billing_address: nil,
                       billing_personal_address: nil,
                       customer_account: nil,
                       customer_address: nil,
                       pay_pal_transaction_id: nil,
                       protection_eligibility: nil,
                       shipping_address: nil)
          super()
          @billing_address = billing_address
          @billing_personal_address = billing_personal_address
          @customer_account = customer_account
          @customer_address = customer_address
          @pay_pal_transaction_id = pay_pal_transaction_id
          @protection_eligibility = protection_eligibility
          @shipping_address = shipping_address
        end

        # Sets the property and returns this same instance.
        def with_billing_address(value)
          @billing_address = value
          self
        end

        # Sets the property and returns this same instance.
        def with_billing_personal_address(value)
          @billing_personal_address = value
          self
        end

        # Sets the property and returns this same instance.
        def with_customer_account(value)
          @customer_account = value
          self
        end

        # Sets the property and returns this same instance.
        def with_customer_address(value)
          @customer_address = value
          self
        end

        # Sets the property and returns this same instance.
        def with_pay_pal_transaction_id(value)
          @pay_pal_transaction_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_protection_eligibility(value)
          @protection_eligibility = value
          self
        end

        # Sets the property and returns this same instance.
        def with_shipping_address(value)
          @shipping_address = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['billingAddress'] = @billing_address.to_h unless @billing_address.nil?
          hash['billingPersonalAddress'] = @billing_personal_address.to_h unless @billing_personal_address.nil?
          hash['customerAccount'] = @customer_account.to_h unless @customer_account.nil?
          hash['customerAddress'] = @customer_address.to_h unless @customer_address.nil?
          hash['payPalTransactionId'] = @pay_pal_transaction_id unless @pay_pal_transaction_id.nil?
          hash['protectionEligibility'] = @protection_eligibility.to_h unless @protection_eligibility.nil?
          hash['shippingAddress'] = @shipping_address.to_h unless @shipping_address.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'billingAddress'
            raise TypeError, "value '#{hash['billingAddress']}' is not a Hash" unless hash['billingAddress'].is_a? Hash
            @billing_address = OnlinePayments::SDK::Domain::Address.new_from_hash(hash['billingAddress'])
          end
          if hash.key? 'billingPersonalAddress'
            raise TypeError, "value '#{hash['billingPersonalAddress']}' is not a Hash" unless hash['billingPersonalAddress'].is_a? Hash
            @billing_personal_address = OnlinePayments::SDK::Domain::AddressPersonal.new_from_hash(hash['billingPersonalAddress'])
          end
          if hash.key? 'customerAccount'
            raise TypeError, "value '#{hash['customerAccount']}' is not a Hash" unless hash['customerAccount'].is_a? Hash
            @customer_account = OnlinePayments::SDK::Domain::PaymentProduct840CustomerAccount.new_from_hash(hash['customerAccount'])
          end
          if hash.key? 'customerAddress'
            raise TypeError, "value '#{hash['customerAddress']}' is not a Hash" unless hash['customerAddress'].is_a? Hash
            @customer_address = OnlinePayments::SDK::Domain::Address.new_from_hash(hash['customerAddress'])
          end
          if hash.key? 'payPalTransactionId'
            @pay_pal_transaction_id = hash['payPalTransactionId']
          end
          if hash.key? 'protectionEligibility'
            raise TypeError, "value '#{hash['protectionEligibility']}' is not a Hash" unless hash['protectionEligibility'].is_a? Hash
            @protection_eligibility = OnlinePayments::SDK::Domain::ProtectionEligibility.new_from_hash(hash['protectionEligibility'])
          end
          if hash.key? 'shippingAddress'
            raise TypeError, "value '#{hash['shippingAddress']}' is not a Hash" unless hash['shippingAddress'].is_a? Hash
            @shipping_address = OnlinePayments::SDK::Domain::AddressPersonal.new_from_hash(hash['shippingAddress'])
          end
        end
      end
    end
  end
end
