#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] extra_merchant_data
    class RedirectPaymentProduct3306SpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :extra_merchant_data

      # @return (Hash)
      def to_h
        hash = super
        hash['extraMerchantData'] = @extra_merchant_data unless @extra_merchant_data.nil?
        hash
      end

      def from_hash(hash)
        super
        @extra_merchant_data = hash['extraMerchantData'] if hash.key? 'extraMerchantData'
      end
    end
  end
end
