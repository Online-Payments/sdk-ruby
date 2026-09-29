#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] id
      # @attr [String, nil] type
      class SessionDetails < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :id

        attr_accessor :type

        # Sets the property and returns this same instance.
        def with_id(value)
          @id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_type(value)
          @type = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['id'] = @id unless @id.nil?
          hash['type'] = @type unless @type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'id'
            @id = hash['id']
          end
          if hash.has_key? 'type'
            @type = hash['type']
          end
        end
      end
    end
  end
end
