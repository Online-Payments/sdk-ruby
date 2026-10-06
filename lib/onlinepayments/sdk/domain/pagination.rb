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
          if hash.has_key? 'page'
            @page = hash['page']
          end
          if hash.has_key? 'pageSize'
            @page_size = hash['pageSize']
          end
        end
      end
    end
  end
end
