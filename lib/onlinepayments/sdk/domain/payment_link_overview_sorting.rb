#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] sort_direction
      # @attr [String, nil] sort_property
      class PaymentLinkOverviewSorting < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :sort_direction

        attr_accessor :sort_property

        # Sets the property and returns this same instance.
        def with_sort_direction(value)
          @sort_direction = value
          self
        end

        # Sets the property and returns this same instance.
        def with_sort_property(value)
          @sort_property = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['sortDirection'] = @sort_direction unless @sort_direction.nil?
          hash['sortProperty'] = @sort_property unless @sort_property.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'sortDirection'
            @sort_direction = hash['sortDirection']
          end
          if hash.has_key? 'sortProperty'
            @sort_property = hash['sortProperty']
          end
        end
      end
    end
  end
end
