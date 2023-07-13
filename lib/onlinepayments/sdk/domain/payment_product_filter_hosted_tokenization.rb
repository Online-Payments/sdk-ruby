#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [Array<Integer>] products
    class PaymentProductFilterHostedTokenization < OnlinePayments::SDK::DataObject
      attr_accessor :products

      # @return (Hash)
      def to_h
        hash = super
        hash['products'] = @products unless @products.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'products'
          raise TypeError, "value '%s' is not an Array" % [hash['products']] unless hash['products'].is_a? Array
          @products = []
          hash['products'].each do |e|
            @products << e
          end
        end
      end
    end
  end
end
