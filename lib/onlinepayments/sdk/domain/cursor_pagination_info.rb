#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] has_more
      # @attr [String] next_cursor
      class CursorPaginationInfo < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :has_more

        attr_accessor :next_cursor

        # @return (Hash)
        def to_h
          hash = super
          hash['hasMore'] = @has_more unless @has_more.nil?
          hash['nextCursor'] = @next_cursor unless @next_cursor.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'hasMore'
            @has_more = hash['hasMore']
          end
          if hash.has_key? 'nextCursor'
            @next_cursor = hash['nextCursor']
          end
        end
      end
    end
  end
end
