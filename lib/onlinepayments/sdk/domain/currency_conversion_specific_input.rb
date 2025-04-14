#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] dcc_enabled
      class CurrencyConversionSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :dcc_enabled

        # @return (Hash)
        def to_h
          hash = super
          hash['dccEnabled'] = @dcc_enabled unless @dcc_enabled.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'dccEnabled'
            @dcc_enabled = hash['dccEnabled']
          end
        end
      end
    end
  end
end
