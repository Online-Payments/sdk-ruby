#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] name
      class CompanyInformation < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :name

        # Sets the property and returns this same instance.
        def with_name(value)
          @name = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['name'] = @name unless @name.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'name'
            @name = hash['name']
          end
        end
      end
    end
  end
end
