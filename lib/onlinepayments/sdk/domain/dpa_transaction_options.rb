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

        # @return (Hash)
        def to_h
          hash = super
          hash['threeDsInputData'] = @three_ds_input_data.to_h unless @three_ds_input_data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'threeDsInputData'
            raise TypeError, "value '%s' is not a Hash" % [hash['threeDsInputData']] unless hash['threeDsInputData'].is_a? Hash
            @three_ds_input_data = OnlinePayments::SDK::Domain::ThreeDsInputData.new_from_hash(hash['threeDsInputData'])
          end
        end
      end
    end
  end
end
