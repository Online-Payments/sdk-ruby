#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_field_form_element'
require 'onlinepayments/sdk/domain/payment_product_field_tooltip'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] always_show
      # @attr [Integer] display_order
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFieldFormElement] form_element
      # @attr [String] label
      # @attr [String] link
      # @attr [String] mask
      # @attr [true/false] obfuscate
      # @attr [String] placeholder_label
      # @attr [String] preferred_input_type
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFieldTooltip] tooltip
      class PaymentProductFieldDisplayHints < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :always_show

        attr_accessor :display_order

        attr_accessor :form_element

        attr_accessor :label

        # @deprecated Deprecated
        attr_accessor :link

        attr_accessor :mask

        attr_accessor :obfuscate

        attr_accessor :placeholder_label

        attr_accessor :preferred_input_type

        attr_accessor :tooltip

        # @return (Hash)
        def to_h
          hash = super
          hash['alwaysShow'] = @always_show unless @always_show.nil?
          hash['displayOrder'] = @display_order unless @display_order.nil?
          hash['formElement'] = @form_element.to_h unless @form_element.nil?
          hash['label'] = @label unless @label.nil?
          hash['link'] = @link unless @link.nil?
          hash['mask'] = @mask unless @mask.nil?
          hash['obfuscate'] = @obfuscate unless @obfuscate.nil?
          hash['placeholderLabel'] = @placeholder_label unless @placeholder_label.nil?
          hash['preferredInputType'] = @preferred_input_type unless @preferred_input_type.nil?
          hash['tooltip'] = @tooltip.to_h unless @tooltip.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'alwaysShow'
            @always_show = hash['alwaysShow']
          end
          if hash.has_key? 'displayOrder'
            @display_order = hash['displayOrder']
          end
          if hash.has_key? 'formElement'
            raise TypeError, "value '%s' is not a Hash" % [hash['formElement']] unless hash['formElement'].is_a? Hash
            @form_element = OnlinePayments::SDK::Domain::PaymentProductFieldFormElement.new_from_hash(hash['formElement'])
          end
          if hash.has_key? 'label'
            @label = hash['label']
          end
          if hash.has_key? 'link'
            @link = hash['link']
          end
          if hash.has_key? 'mask'
            @mask = hash['mask']
          end
          if hash.has_key? 'obfuscate'
            @obfuscate = hash['obfuscate']
          end
          if hash.has_key? 'placeholderLabel'
            @placeholder_label = hash['placeholderLabel']
          end
          if hash.has_key? 'preferredInputType'
            @preferred_input_type = hash['preferredInputType']
          end
          if hash.has_key? 'tooltip'
            raise TypeError, "value '%s' is not a Hash" % [hash['tooltip']] unless hash['tooltip'].is_a? Hash
            @tooltip = OnlinePayments::SDK::Domain::PaymentProductFieldTooltip.new_from_hash(hash['tooltip'])
          end
        end
      end
    end
  end
end
