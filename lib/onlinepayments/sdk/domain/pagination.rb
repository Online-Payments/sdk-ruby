# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] page
      # @attr [Integer, nil] page_size
      class Pagination < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :page

        attr_accessor :page_size

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(page: nil, page_size: nil)
          super()
          @page = page
          @page_size = page_size
        end

        # Sets the property and returns this same instance.
        def with_page(value)
          @page = value
          self
        end

        # Sets the property and returns this same instance.
        def with_page_size(value)
          @page_size = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['page'] = @page unless @page.nil?
          hash['pageSize'] = @page_size unless @page_size.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'page'
            @page = hash['page']
          end
          if hash.key? 'pageSize'
            @page_size = hash['pageSize']
          end
        end
      end
    end
  end
end
