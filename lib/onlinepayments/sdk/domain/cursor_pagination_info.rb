# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] has_more
      # @attr [String, nil] next_cursor
      class CursorPaginationInfo < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :has_more

        attr_accessor :next_cursor

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(has_more: nil, next_cursor: nil)
          super()
          @has_more = has_more
          @next_cursor = next_cursor
        end

        # Sets the property and returns this same instance.
        def with_has_more(value)
          @has_more = value
          self
        end

        # Sets the property and returns this same instance.
        def with_next_cursor(value)
          @next_cursor = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['hasMore'] = @has_more unless @has_more.nil?
          hash['nextCursor'] = @next_cursor unless @next_cursor.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'hasMore'
            @has_more = hash['hasMore']
          end
          if hash.key? 'nextCursor'
            @next_cursor = hash['nextCursor']
          end
        end
      end
    end
  end
end
