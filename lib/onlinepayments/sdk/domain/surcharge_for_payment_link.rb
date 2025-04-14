#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] surcharge_mode
      class SurchargeForPaymentLink < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :surcharge_mode

        # @return (Hash)
        def to_h
          hash = super
          hash['surchargeMode'] = @surcharge_mode unless @surcharge_mode.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'surchargeMode'
            @surcharge_mode = hash['surchargeMode']
          end
        end
      end
    end
  end
end
