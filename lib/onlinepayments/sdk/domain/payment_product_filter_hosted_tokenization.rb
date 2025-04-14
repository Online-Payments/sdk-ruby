#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<Integer>] products
      class PaymentProductFilterHostedTokenization < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :products

        # @return (Hash)
        def to_h
          hash = super
          hash['products'] = @products unless @products.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'products'
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
end
