#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mandate_redirect_data'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] action_type
      # @attr [OnlinePayments::SDK::Domain::MandateRedirectData] redirect_data
      class MandateMerchantAction < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :action_type

        attr_accessor :redirect_data

        # @return (Hash)
        def to_h
          hash = super
          hash['actionType'] = @action_type unless @action_type.nil?
          hash['redirectData'] = @redirect_data.to_h unless @redirect_data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'actionType'
            @action_type = hash['actionType']
          end
          if hash.has_key? 'redirectData'
            raise TypeError, "value '%s' is not a Hash" % [hash['redirectData']] unless hash['redirectData'].is_a? Hash
            @redirect_data = OnlinePayments::SDK::Domain::MandateRedirectData.new_from_hash(hash['redirectData'])
          end
        end
      end
    end
  end
end
