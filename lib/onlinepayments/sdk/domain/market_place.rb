#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] retailer_country
      # @attr [String] retailer_name
      class MarketPlace < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :retailer_country

        attr_accessor :retailer_name

        # @return (Hash)
        def to_h
          hash = super
          hash['retailerCountry'] = @retailer_country unless @retailer_country.nil?
          hash['retailerName'] = @retailer_name unless @retailer_name.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'retailerCountry'
            @retailer_country = hash['retailerCountry']
          end
          if hash.has_key? 'retailerName'
            @retailer_name = hash['retailerName']
          end
        end
      end
    end
  end
end
