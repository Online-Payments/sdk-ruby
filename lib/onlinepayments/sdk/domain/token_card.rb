#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/token_card_data'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] alias
      # @attr [OnlinePayments::SDK::Domain::TokenCardData] data
      class TokenCard < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :alias

        attr_accessor :data

        # @return (Hash)
        def to_h
          hash = super
          hash['alias'] = @alias unless @alias.nil?
          hash['data'] = @data.to_h unless @data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'alias'
            @alias = hash['alias']
          end
          if hash.has_key? 'data'
            raise TypeError, "value '%s' is not a Hash" % [hash['data']] unless hash['data'].is_a? Hash
            @data = OnlinePayments::SDK::Domain::TokenCardData.new_from_hash(hash['data'])
          end
        end
      end
    end
  end
end
