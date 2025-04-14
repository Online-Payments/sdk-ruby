#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/customer_bank_account'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CustomerBankAccount] customer_bank_account
      # @attr [true/false] instant_payment_only
      class RedirectPaymentProduct5408SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :customer_bank_account

        attr_accessor :instant_payment_only

        # @return (Hash)
        def to_h
          hash = super
          hash['customerBankAccount'] = @customer_bank_account.to_h unless @customer_bank_account.nil?
          hash['instantPaymentOnly'] = @instant_payment_only unless @instant_payment_only.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'customerBankAccount'
            raise TypeError, "value '%s' is not a Hash" % [hash['customerBankAccount']] unless hash['customerBankAccount'].is_a? Hash
            @customer_bank_account = OnlinePayments::SDK::Domain::CustomerBankAccount.new_from_hash(hash['customerBankAccount'])
          end
          if hash.has_key? 'instantPaymentOnly'
            @instant_payment_only = hash['instantPaymentOnly']
          end
        end
      end
    end
  end
end
