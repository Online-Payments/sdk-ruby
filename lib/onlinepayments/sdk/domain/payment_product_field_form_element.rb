#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/value_mapping_element'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] type
      # @attr [Array<OnlinePayments::SDK::Domain::ValueMappingElement>] value_mapping
      class PaymentProductFieldFormElement < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :type

        # @deprecated This field is not used by any payment product
        attr_accessor :value_mapping

        # @return (Hash)
        def to_h
          hash = super
          hash['type'] = @type unless @type.nil?
          hash['valueMapping'] = @value_mapping.collect{|val| val.to_h} unless @value_mapping.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'type'
            @type = hash['type']
          end
          if hash.has_key? 'valueMapping'
            raise TypeError, "value '%s' is not an Array" % [hash['valueMapping']] unless hash['valueMapping'].is_a? Array
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
