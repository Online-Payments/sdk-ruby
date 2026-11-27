# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] id
      # @attr [String, nil] label
      # @attr [String, nil] type
      # @attr [String, nil] value
      class PaymentProductFieldDisplayElement < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :id

        attr_accessor :label

        attr_accessor :type

        attr_accessor :value

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(id: nil, label: nil, type: nil, value: nil)
          super()
          @id = id
          @label = label
          @type = type
          @value = value
        end

        # Sets the property and returns this same instance.
        def with_id(value)
          @id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_label(value)
          @label = value
          self
        end

        # Sets the property and returns this same instance.
        def with_type(value)
          @type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_value(value)
          @value = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['id'] = @id unless @id.nil?
          hash['label'] = @label unless @label.nil?
          hash['type'] = @type unless @type.nil?
          hash['value'] = @value unless @value.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'id'
            @id = hash['id']
          end
          if hash.key? 'label'
            @label = hash['label']
          end
          if hash.key? 'type'
            @type = hash['type']
          end
          if hash.key? 'value'
            @value = hash['value']
          end
        end
      end
    end
  end
end
