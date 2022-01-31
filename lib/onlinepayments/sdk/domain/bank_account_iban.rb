#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] iban
    class BankAccountIban < OnlinePayments::SDK::DataObject
      attr_accessor :iban

      # @return (Hash)
      def to_h
        hash = super
        hash['iban'] = @iban unless @iban.nil?
        hash
      end

      def from_hash(hash)
        super
        @iban = hash['iban'] if hash.key? 'iban'
      end
    end
  end
end
