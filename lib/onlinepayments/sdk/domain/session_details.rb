# frozen_string_literal: true

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

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(id: nil, type: nil)
          super()
          @id = id
          @type = type
        end

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
          if hash.key? 'id'
            @id = hash['id']
          end
          if hash.key? 'type'
            @type = hash['type']
          end
        end
      end
    end
  end
end
