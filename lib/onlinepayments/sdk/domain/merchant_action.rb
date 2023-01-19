#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/redirect_data'
require 'onlinepayments/sdk/domain/show_form_data'

module OnlinePayments::SDK
  module Domain

    # @attr [String] action_type
    # @attr [OnlinePayments::SDK::Domain::RedirectData] redirect_data
    # @attr [OnlinePayments::SDK::Domain::ShowFormData] show_form_data
    class MerchantAction < OnlinePayments::SDK::DataObject
      attr_accessor :action_type
      attr_accessor :redirect_data
      attr_accessor :show_form_data

      # @return (Hash)
      def to_h
        hash = super
        hash['actionType'] = @action_type unless @action_type.nil?
        hash['redirectData'] = @redirect_data.to_h if @redirect_data
        hash['showFormData'] = @show_form_data.to_h if @show_form_data
        hash
      end

      def from_hash(hash)
        super
        @action_type = hash['actionType'] if hash.key? 'actionType'
        if hash.key? 'redirectData'
          raise TypeError, "value '%s' is not a Hash" % [hash['redirectData']] unless hash['redirectData'].is_a? Hash
          @redirect_data = OnlinePayments::SDK::Domain::RedirectData.new_from_hash(hash['redirectData'])
        end
        if hash.key? 'showFormData'
          raise TypeError, "value '%s' is not a Hash" % [hash['showFormData']] unless hash['showFormData'].is_a? Hash
          @show_form_data = OnlinePayments::SDK::Domain::ShowFormData.new_from_hash(hash['showFormData'])
        end
      end
    end
  end
end
