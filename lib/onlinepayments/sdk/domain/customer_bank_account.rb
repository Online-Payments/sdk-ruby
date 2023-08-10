#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] account_holder_name
    # @attr [String] bic
    # @attr [String] iban
    class CustomerBankAccount < OnlinePayments::SDK::DataObject
      attr_accessor :account_holder_name
      attr_accessor :bic
      attr_accessor :iban

      # @return (Hash)
      def to_h
        hash = super
        hash['accountHolderName'] = @account_holder_name unless @account_holder_name.nil?
        hash['bic'] = @bic unless @bic.nil?
        hash['iban'] = @iban unless @iban.nil?
        hash
      end

      def from_hash(hash)
        super
        @account_holder_name = hash['accountHolderName'] if hash.key? 'accountHolderName'
        @bic = hash['bic'] if hash.key? 'bic'
        @iban = hash['iban'] if hash.key? 'iban'
      end
    end
  end
end
