# frozen_string_literal: true

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

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(java_script_sdk_flow: nil, address_selection_at_pay_pal: nil, custom: nil, pay_later: nil)
          super()
          @java_script_sdk_flow = java_script_sdk_flow
          @address_selection_at_pay_pal = address_selection_at_pay_pal
          @custom = custom
          @pay_later = pay_later
        end

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
          if hash.key? 'JavaScriptSdkFlow'
            @java_script_sdk_flow = hash['JavaScriptSdkFlow']
          end
          if hash.key? 'addressSelectionAtPayPal'
            @address_selection_at_pay_pal = hash['addressSelectionAtPayPal']
          end
          if hash.key? 'custom'
            @custom = hash['custom']
          end
          if hash.key? 'payLater'
            @pay_later = hash['payLater']
          end
        end
      end
    end
  end
end
