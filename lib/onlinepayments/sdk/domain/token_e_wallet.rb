#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/customer_token'

module OnlinePayments::SDK
  module Domain

    # @attr [String] alias
    # @attr [OnlinePayments::SDK::Domain::CustomerToken] customer
    class TokenEWallet < OnlinePayments::SDK::DataObject
      attr_accessor :alias
      attr_accessor :customer

      # @return (Hash)
      def to_h
        hash = super
        hash['alias'] = @alias unless @alias.nil?
        hash['customer'] = @customer.to_h if @customer
        hash
      end

      def from_hash(hash)
        super
        @alias = hash['alias'] if hash.key? 'alias'
        if hash.key? 'customer'
          raise TypeError, "value '%s' is not a Hash" % [hash['customer']] unless hash['customer'].is_a? Hash
          @customer = OnlinePayments::SDK::Domain::CustomerToken.new_from_hash(hash['customer'])
        end
      end
    end
  end
end
