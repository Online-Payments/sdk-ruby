# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mandate_redirect_data'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] action_type
      # @attr [OnlinePayments::SDK::Domain::MandateRedirectData, nil] redirect_data
      class MandateMerchantAction < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :action_type

        attr_accessor :redirect_data

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(action_type: nil, redirect_data: nil)
          super()
          @action_type = action_type
          @redirect_data = redirect_data
        end

        # Sets the property and returns this same instance.
        def with_action_type(value)
          @action_type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_redirect_data(value)
          @redirect_data = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['actionType'] = @action_type unless @action_type.nil?
          hash['redirectData'] = @redirect_data.to_h unless @redirect_data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'actionType'
            @action_type = hash['actionType']
          end
          if hash.key? 'redirectData'
            raise TypeError, "value '#{hash['redirectData']}' is not a Hash" unless hash['redirectData'].is_a? Hash
            @redirect_data = OnlinePayments::SDK::Domain::MandateRedirectData.new_from_hash(hash['redirectData'])
          end
        end
      end
    end
  end
end
