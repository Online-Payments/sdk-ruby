# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] account_holder_name
      # @attr [String, nil] bic
      # @attr [String, nil] iban
      class CustomerBankAccount < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :account_holder_name

        attr_accessor :bic

        attr_accessor :iban

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(account_holder_name: nil, bic: nil, iban: nil)
          super()
          @account_holder_name = account_holder_name
          @bic = bic
          @iban = iban
        end

        # Sets the property and returns this same instance.
        def with_account_holder_name(value)
          @account_holder_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_bic(value)
          @bic = value
          self
        end

        # Sets the property and returns this same instance.
        def with_iban(value)
          @iban = value
          self
        end

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
          if hash.key? 'accountHolderName'
            @account_holder_name = hash['accountHolderName']
          end
          if hash.key? 'bic'
            @bic = hash['bic']
          end
          if hash.key? 'iban'
            @iban = hash['iban']
          end
        end
      end
    end
  end
end
