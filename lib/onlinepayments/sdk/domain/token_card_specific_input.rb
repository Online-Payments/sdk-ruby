#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/token_data'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::TokenData] data
    class TokenCardSpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :data

      # @return (Hash)
      def to_h
        hash = super
        hash['data'] = @data.to_h if @data
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'data'
          raise TypeError, "value '%s' is not a Hash" % [hash['data']] unless hash['data'].is_a? Hash
          @data = OnlinePayments::SDK::Domain::TokenData.new_from_hash(hash['data'])
        end
      end
    end
  end
end
