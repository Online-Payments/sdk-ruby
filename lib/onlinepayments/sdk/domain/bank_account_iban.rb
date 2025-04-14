#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] iban
      class BankAccountIban < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :iban

        # @return (Hash)
        def to_h
          hash = super
          hash['iban'] = @iban unless @iban.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'iban'
            @iban = hash['iban']
          end
        end
      end
    end
  end
end
