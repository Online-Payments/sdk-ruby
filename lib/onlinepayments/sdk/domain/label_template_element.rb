#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] attribute_key
      # @attr [String, nil] mask
      class LabelTemplateElement < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :attribute_key

        attr_accessor :mask

        # Sets the property and returns this same instance.
        def with_attribute_key(value)
          @attribute_key = value
          self
        end

        # Sets the property and returns this same instance.
        def with_mask(value)
          @mask = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['attributeKey'] = @attribute_key unless @attribute_key.nil?
          hash['mask'] = @mask unless @mask.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'attributeKey'
            @attribute_key = hash['attributeKey']
          end
          if hash.has_key? 'mask'
            @mask = hash['mask']
          end
        end
      end
    end
  end
end
