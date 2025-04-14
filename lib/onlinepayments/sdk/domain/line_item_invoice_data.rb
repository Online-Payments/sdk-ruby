#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] description
      class LineItemInvoiceData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :description

        # @return (Hash)
        def to_h
          hash = super
          hash['description'] = @description unless @description.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'description'
            @description = hash['description']
          end
        end
      end
    end
  end
end
