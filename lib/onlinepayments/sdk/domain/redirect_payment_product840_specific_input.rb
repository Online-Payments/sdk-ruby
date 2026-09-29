#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] java_script_sdk_flow
      # @attr [true/false, nil] address_selection_at_pay_pal
      # @attr [String, nil] custom
      # @attr [true/false, nil] pay_later
      class RedirectPaymentProduct840SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :java_script_sdk_flow

        attr_accessor :address_selection_at_pay_pal

        attr_accessor :custom

        attr_accessor :pay_later

        # Sets the property and returns this same instance.
        def with_java_script_sdk_flow(value)
          @java_script_sdk_flow = value
          self
        end

        # Sets the property and returns this same instance.
        def with_address_selection_at_pay_pal(value)
          @address_selection_at_pay_pal = value
          self
        end

        # Sets the property and returns this same instance.
        def with_custom(value)
          @custom = value
          self
        end

        # Sets the property and returns this same instance.
        def with_pay_later(value)
          @pay_later = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['JavaScriptSdkFlow'] = @java_script_sdk_flow unless @java_script_sdk_flow.nil?
          hash['addressSelectionAtPayPal'] = @address_selection_at_pay_pal unless @address_selection_at_pay_pal.nil?
          hash['custom'] = @custom unless @custom.nil?
          hash['payLater'] = @pay_later unless @pay_later.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'JavaScriptSdkFlow'
            @java_script_sdk_flow = hash['JavaScriptSdkFlow']
          end
          if hash.has_key? 'addressSelectionAtPayPal'
            @address_selection_at_pay_pal = hash['addressSelectionAtPayPal']
          end
          if hash.has_key? 'custom'
            @custom = hash['custom']
          end
          if hash.has_key? 'payLater'
            @pay_later = hash['payLater']
          end
        end
      end
    end
  end
end
