# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/customer_bank_account'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CustomerBankAccount, nil] customer_bank_account
      class RedirectPaymentProduct5406SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :customer_bank_account

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(customer_bank_account: nil)
          super()
          @customer_bank_account = customer_bank_account
        end

        # Sets the property and returns this same instance.
        def with_customer_bank_account(value)
          @customer_bank_account = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['customerBankAccount'] = @customer_bank_account.to_h unless @customer_bank_account.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'customerBankAccount'
            raise TypeError, "value '#{hash['customerBankAccount']}' is not a Hash" unless hash['customerBankAccount'].is_a? Hash
            @customer_bank_account = OnlinePayments::SDK::Domain::CustomerBankAccount.new_from_hash(hash['customerBankAccount'])
          end
        end
      end
    end
  end
end
