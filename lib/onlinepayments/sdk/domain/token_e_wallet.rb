# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/customer_token'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] alias
      # @attr [OnlinePayments::SDK::Domain::CustomerToken, nil] customer
      class TokenEWallet < OnlinePayments::SDK::Domain::DataObject

        # @deprecated This field is not used by any payment product An alias for the token. This can be used to visually represent the token.
        attr_accessor :alias

        attr_accessor :customer

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(alias: nil, customer: nil)
          super()
          @alias = binding.local_variable_get(:alias)
          @customer = customer
        end

        # Sets the property and returns this same instance.
        def with_alias(value)
          @alias = value
          self
        end

        # Sets the property and returns this same instance.
        def with_customer(value)
          @customer = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['alias'] = @alias unless @alias.nil?
          hash['customer'] = @customer.to_h unless @customer.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'alias'
            @alias = hash['alias']
          end
          if hash.key? 'customer'
            raise TypeError, "value '#{hash['customer']}' is not a Hash" unless hash['customer'].is_a? Hash
            @customer = OnlinePayments::SDK::Domain::CustomerToken.new_from_hash(hash['customer'])
          end
        end
      end
    end
  end
end
