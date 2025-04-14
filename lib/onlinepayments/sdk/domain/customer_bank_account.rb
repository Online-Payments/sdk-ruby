#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] account_holder_name
      # @attr [String] bic
      # @attr [String] iban
      class CustomerBankAccount < OnlinePayments::SDK::Domain::DataObject

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
          if hash.has_key? 'accountHolderName'
            @account_holder_name = hash['accountHolderName']
          end
          if hash.has_key? 'bic'
            @bic = hash['bic']
          end
          if hash.has_key? 'iban'
            @iban = hash['iban']
          end
        end
      end
    end
  end
end
