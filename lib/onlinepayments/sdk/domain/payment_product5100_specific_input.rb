#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] brand
      class PaymentProduct5100SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :brand

        # @return (Hash)
        def to_h
          hash = super
          hash['brand'] = @brand unless @brand.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'brand'
            @brand = hash['brand']
          end
        end
      end
    end
  end
end
