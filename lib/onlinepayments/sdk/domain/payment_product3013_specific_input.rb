#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] market_number
      # @attr [String] purchasing_buyer_reference1
      # @attr [String] purchasing_buyer_reference2
      class PaymentProduct3013SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :market_number

        attr_accessor :purchasing_buyer_reference1

        attr_accessor :purchasing_buyer_reference2

        # @return (Hash)
        def to_h
          hash = super
          hash['marketNumber'] = @market_number unless @market_number.nil?
          hash['purchasingBuyerReference1'] = @purchasing_buyer_reference1 unless @purchasing_buyer_reference1.nil?
          hash['purchasingBuyerReference2'] = @purchasing_buyer_reference2 unless @purchasing_buyer_reference2.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'marketNumber'
            @market_number = hash['marketNumber']
          end
          if hash.has_key? 'purchasingBuyerReference1'
            @purchasing_buyer_reference1 = hash['purchasingBuyerReference1']
          end
          if hash.has_key? 'purchasingBuyerReference2'
            @purchasing_buyer_reference2 = hash['purchasingBuyerReference2']
          end
        end
      end
    end
  end
end
