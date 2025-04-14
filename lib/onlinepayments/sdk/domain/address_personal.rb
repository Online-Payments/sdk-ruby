#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/personal_name'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] additional_info
      # @attr [String] city
      # @attr [String] company_name
      # @attr [String] country_code
      # @attr [String] house_number
      # @attr [OnlinePayments::SDK::Domain::PersonalName] name
      # @attr [String] state
      # @attr [String] street
      # @attr [String] zip
      class AddressPersonal < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :additional_info

        attr_accessor :city

        attr_accessor :company_name

        attr_accessor :country_code

        attr_accessor :house_number

        attr_accessor :name

        attr_accessor :state

        attr_accessor :street

        attr_accessor :zip

        # @return (Hash)
        def to_h
          hash = super
          hash['additionalInfo'] = @additional_info unless @additional_info.nil?
          hash['city'] = @city unless @city.nil?
          hash['companyName'] = @company_name unless @company_name.nil?
          hash['countryCode'] = @country_code unless @country_code.nil?
          hash['houseNumber'] = @house_number unless @house_number.nil?
          hash['name'] = @name.to_h unless @name.nil?
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
          if hash.has_key? 'companyName'
            @company_name = hash['companyName']
          end
          if hash.has_key? 'countryCode'
            @country_code = hash['countryCode']
          end
          if hash.has_key? 'houseNumber'
            @house_number = hash['houseNumber']
          end
          if hash.has_key? 'name'
            raise TypeError, "value '%s' is not a Hash" % [hash['name']] unless hash['name'].is_a? Hash
            @name = OnlinePayments::SDK::Domain::PersonalName.new_from_hash(hash['name'])
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
