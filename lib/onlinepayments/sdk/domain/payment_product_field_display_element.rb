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
          if hash.has_key? 'id'
            @id = hash['id']
          end
          if hash.has_key? 'label'
            @label = hash['label']
          end
          if hash.has_key? 'type'
            @type = hash['type']
          end
          if hash.has_key? 'value'
            @value = hash['value']
          end
        end
      end
    end
  end
end
