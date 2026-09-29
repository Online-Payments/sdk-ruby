#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] retailer_country
      # @attr [String, nil] retailer_name
      class MarketPlace < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :retailer_country

        attr_accessor :retailer_name

        # Sets the property and returns this same instance.
        def with_retailer_country(value)
          @retailer_country = value
          self
        end

        # Sets the property and returns this same instance.
        def with_retailer_name(value)
          @retailer_name = value
          self
        end

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
