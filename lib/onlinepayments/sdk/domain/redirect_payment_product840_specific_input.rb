#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] java_script_sdk_flow
      # @attr [true/false] address_selection_at_pay_pal
      # @attr [String] custom
      # @attr [true/false] pay_later
      class RedirectPaymentProduct840SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :java_script_sdk_flow

        attr_accessor :address_selection_at_pay_pal

        attr_accessor :custom

        attr_accessor :pay_later

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
