#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] extra_merchant_data
      class RedirectPaymentProduct3306SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :extra_merchant_data

        # @return (Hash)
        def to_h
          hash = super
          hash['extraMerchantData'] = @extra_merchant_data unless @extra_merchant_data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'extraMerchantData'
            @extra_merchant_data = hash['extraMerchantData']
          end
        end
      end
    end
  end
end
