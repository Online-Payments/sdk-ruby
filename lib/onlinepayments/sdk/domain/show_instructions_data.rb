#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] show_data
      class ShowInstructionsData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :show_data

        # @return (Hash)
        def to_h
          hash = super
          hash['showData'] = @show_data unless @show_data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'showData'
            @show_data = hash['showData']
          end
        end
      end
    end
  end
end
