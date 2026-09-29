#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_field_form_element'
require 'onlinepayments/sdk/domain/payment_product_field_tooltip'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] always_show
      # @attr [Integer, nil] display_order
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFieldFormElement, nil] form_element
      # @attr [String, nil] label
      # @attr [String, nil] link
      # @attr [String, nil] mask
      # @attr [true/false, nil] obfuscate
      # @attr [String, nil] placeholder_label
      # @attr [String, nil] preferred_input_type
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFieldTooltip, nil] tooltip
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

        # Sets the property and returns this same instance.
        def with_always_show(value)
          @always_show = value
          self
        end

        # Sets the property and returns this same instance.
        def with_display_order(value)
          @display_order = value
          self
        end

        # Sets the property and returns this same instance.
        def with_form_element(value)
          @form_element = value
          self
        end

        # Sets the property and returns this same instance.
        def with_label(value)
          @label = value
          self
        end

        # Sets the property and returns this same instance.
        def with_link(value)
          @link = value
          self
        end

        # Sets the property and returns this same instance.
        def with_mask(value)
          @mask = value
          self
        end

        # Sets the property and returns this same instance.
        def with_obfuscate(value)
          @obfuscate = value
          self
        end

        # Sets the property and returns this same instance.
        def with_placeholder_label(value)
          @placeholder_label = value
          self
        end

        # Sets the property and returns this same instance.
        def with_preferred_input_type(value)
          @preferred_input_type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_tooltip(value)
          @tooltip = value
          self
        end

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
