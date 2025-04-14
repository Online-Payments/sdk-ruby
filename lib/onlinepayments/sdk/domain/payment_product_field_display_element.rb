#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] id
      # @attr [String] label
      # @attr [String] type
      # @attr [String] value
      class PaymentProductFieldDisplayElement < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :id

        attr_accessor :label

        attr_accessor :type

        attr_accessor :value

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
