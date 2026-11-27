# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/three_ds_input_data'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::ThreeDsInputData, nil] three_ds_input_data
      class DpaTransactionOptions < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :three_ds_input_data

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(three_ds_input_data: nil)
          super()
          @three_ds_input_data = three_ds_input_data
        end

        # Sets the property and returns this same instance.
        def with_three_ds_input_data(value)
          @three_ds_input_data = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['threeDsInputData'] = @three_ds_input_data.to_h unless @three_ds_input_data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'threeDsInputData'
            raise TypeError, "value '#{hash['threeDsInputData']}' is not a Hash" unless hash['threeDsInputData'].is_a? Hash
            @three_ds_input_data = OnlinePayments::SDK::Domain::ThreeDsInputData.new_from_hash(hash['threeDsInputData'])
          end
        end
      end
    end
  end
end
