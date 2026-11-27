# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] iban
      class BankAccountIban < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :iban

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(iban: nil)
          super()
          @iban = iban
        end

        # Sets the property and returns this same instance.
        def with_iban(value)
          @iban = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['iban'] = @iban unless @iban.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'iban'
            @iban = hash['iban']
          end
        end
      end
    end
  end
end
