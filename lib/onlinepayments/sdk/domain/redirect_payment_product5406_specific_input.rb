#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/customer_bank_account'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::CustomerBankAccount] customer_bank_account
    class RedirectPaymentProduct5406SpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :customer_bank_account

      # @return (Hash)
      def to_h
        hash = super
        hash['customerBankAccount'] = @customer_bank_account.to_h if @customer_bank_account
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'customerBankAccount'
          raise TypeError, "value '%s' is not a Hash" % [hash['customerBankAccount']] unless hash['customerBankAccount'].is_a? Hash
          @customer_bank_account = OnlinePayments::SDK::Domain::CustomerBankAccount.new_from_hash(hash['customerBankAccount'])
        end
      end
    end
  end
end
