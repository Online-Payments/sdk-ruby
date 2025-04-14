#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] city
      # @attr [String] country_code
      # @attr [String] house_number
      # @attr [String] street
      # @attr [String] zip
      class MandateAddress < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :city

        attr_accessor :country_code

        attr_accessor :house_number

        attr_accessor :street

        attr_accessor :zip

        # @return (Hash)
        def to_h
          hash = super
          hash['city'] = @city unless @city.nil?
          hash['countryCode'] = @country_code unless @country_code.nil?
          hash['houseNumber'] = @house_number unless @house_number.nil?
          hash['street'] = @street unless @street.nil?
          hash['zip'] = @zip unless @zip.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'city'
            @city = hash['city']
          end
          if hash.has_key? 'countryCode'
            @country_code = hash['countryCode']
          end
          if hash.has_key? 'houseNumber'
            @house_number = hash['houseNumber']
          end
          if hash.has_key? 'street'
            @street = hash['street']
          end
          if hash.has_key? 'zip'
            @zip = hash['zip']
          end
        end
      end
    end
  end
end
