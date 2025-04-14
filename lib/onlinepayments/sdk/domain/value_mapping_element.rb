#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_field_display_element'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::PaymentProductFieldDisplayElement>] display_elements
      # @attr [String] value
      class ValueMappingElement < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :display_elements

        attr_accessor :value

        # @return (Hash)
        def to_h
          hash = super
          hash['displayElements'] = @display_elements.collect{|val| val.to_h} unless @display_elements.nil?
          hash['value'] = @value unless @value.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'displayElements'
            raise TypeError, "value '%s' is not an Array" % [hash['displayElements']] unless hash['displayElements'].is_a? Array
            @display_elements = []
            hash['displayElements'].each do |e|
              @display_elements << OnlinePayments::SDK::Domain::PaymentProductFieldDisplayElement.new_from_hash(e)
            end
          end
          if hash.has_key? 'value'
            @value = hash['value']
          end
        end
      end
    end
  end
end
