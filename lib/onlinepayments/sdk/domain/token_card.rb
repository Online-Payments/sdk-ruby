#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/token_card_data'

module OnlinePayments::SDK
  module Domain

    # @attr [String] alias
    # @attr [OnlinePayments::SDK::Domain::TokenCardData] data
    class TokenCard < OnlinePayments::SDK::DataObject
      attr_accessor :alias
      attr_accessor :data

      # @return (Hash)
      def to_h
        hash = super
        hash['alias'] = @alias unless @alias.nil?
        hash['data'] = @data.to_h if @data
        hash
      end

      def from_hash(hash)
        super
        @alias = hash['alias'] if hash.key? 'alias'
        if hash.key? 'data'
          raise TypeError, "value '%s' is not a Hash" % [hash['data']] unless hash['data'].is_a? Hash
          @data = OnlinePayments::SDK::Domain::TokenCardData.new_from_hash(hash['data'])
        end
      end
    end
  end
end
