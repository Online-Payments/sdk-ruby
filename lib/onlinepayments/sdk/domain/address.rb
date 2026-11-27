# frozen_string_literal: true

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

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(additional_info: nil, city: nil, country_code: nil, house_number: nil, state: nil, street: nil, zip: nil)
          super()
          @additional_info = additional_info
          @city = city
          @country_code = country_code
          @house_number = house_number
          @state = state
          @street = street
          @zip = zip
        end

        # Sets the property and returns this same instance.
        def with_additional_info(value)
          @additional_info = value
          self
        end

        # Sets the property and returns this same instance.
        def with_city(value)
          @city = value
          self
        end

        # Sets the property and returns this same instance.
        def with_country_code(value)
          @country_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_house_number(value)
          @house_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_state(value)
          @state = value
          self
        end

        # Sets the property and returns this same instance.
        def with_street(value)
          @street = value
          self
        end

        # Sets the property and returns this same instance.
        def with_zip(value)
          @zip = value
          self
        end

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
          if hash.key? 'additionalInfo'
            @additional_info = hash['additionalInfo']
          end
          if hash.key? 'city'
            @city = hash['city']
          end
          if hash.key? 'countryCode'
            @country_code = hash['countryCode']
          end
          if hash.key? 'houseNumber'
            @house_number = hash['houseNumber']
          end
          if hash.key? 'state'
            @state = hash['state']
          end
          if hash.key? 'street'
            @street = hash['street']
          end
          if hash.key? 'zip'
            @zip = hash['zip']
          end
        end
      end
    end
  end
end
