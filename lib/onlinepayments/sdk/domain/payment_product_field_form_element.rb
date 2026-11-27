# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/value_mapping_element'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] type
      # @attr [Array<OnlinePayments::SDK::Domain::ValueMappingElement>, nil] value_mapping
      class PaymentProductFieldFormElement < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :type

        # @deprecated This field is not used by any payment product
        attr_accessor :value_mapping

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(type: nil, value_mapping: nil)
          super()
          @type = type
          @value_mapping = value_mapping
        end

        # Sets the property and returns this same instance.
        def with_type(value)
          @type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_value_mapping(value)
          @value_mapping = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['type'] = @type unless @type.nil?
          hash['valueMapping'] = @value_mapping.collect{|val| val.to_h} unless @value_mapping.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'type'
            @type = hash['type']
          end
          if hash.key? 'valueMapping'
            raise TypeError, "value '#{hash['valueMapping']}' is not an Array" unless hash['valueMapping'].is_a? Array
            @value_mapping = []
            hash['valueMapping'].each do |e|
              @value_mapping << OnlinePayments::SDK::Domain::ValueMappingElement.new_from_hash(e)
            end
          end
        end
      end
    end
  end
end
