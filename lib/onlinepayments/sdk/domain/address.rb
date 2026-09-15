#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] additional_info
      # @attr [String, nil] city
      # @attr [String, nil] country_code
      # @attr [String, nil] house_number
      # @attr [String, nil] state
      # @attr [String, nil] street
      # @attr [String, nil] zip
      class Address < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :additional_info

        attr_accessor :city

        attr_accessor :country_code

        attr_accessor :house_number

        attr_accessor :state

        attr_accessor :street

        attr_accessor :zip

        # @return (Hash)
        def to_h
          hash = super
          hash['additionalInfo'] = @additional_info unless @additional_info.nil?
          hash['city'] = @city unless @city.nil?
          hash['countryCode'] = @country_code unless @country_code.nil?
          hash['houseNumber'] = @house_number unless @house_number.nil?
          hash['state'] = @state unless @state.nil?
          hash['street'] = @street unless @street.nil?
          hash['zip'] = @zip unless @zip.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'additionalInfo'
            @additional_info = hash['additionalInfo']
          end
          if hash.has_key? 'city'
            @city = hash['city']
          end
          if hash.has_key? 'countryCode'
            @country_code = hash['countryCode']
          end
          if hash.has_key? 'houseNumber'
            @house_number = hash['houseNumber']
          end
          if hash.has_key? 'state'
            @state = hash['state']
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
