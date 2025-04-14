#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/customer_token'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] alias
      # @attr [OnlinePayments::SDK::Domain::CustomerToken] customer
      class TokenEWallet < OnlinePayments::SDK::Domain::DataObject

        # @deprecated This field is not used by any payment product An alias for the token. This can be used to visually represent the token.
        attr_accessor :alias

        attr_accessor :customer

        # @return (Hash)
        def to_h
          hash = super
          hash['alias'] = @alias unless @alias.nil?
          hash['customer'] = @customer.to_h unless @customer.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'alias'
            @alias = hash['alias']
          end
          if hash.has_key? 'customer'
            raise TypeError, "value '%s' is not a Hash" % [hash['customer']] unless hash['customer'].is_a? Hash
            @customer = OnlinePayments::SDK::Domain::CustomerToken.new_from_hash(hash['customer'])
          end
        end
      end
    end
  end
end
