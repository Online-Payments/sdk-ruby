#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] brand
    class PaymentProduct5100SpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :brand

      # @return (Hash)
      def to_h
        hash = super
        hash['brand'] = @brand unless @brand.nil?
        hash
      end

      def from_hash(hash)
        super
        @brand = hash['brand'] if hash.key? 'brand'
      end
    end
  end
end
