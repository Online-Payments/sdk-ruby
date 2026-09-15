#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] address
      # @attr [String, nil] city
      # @attr [Integer, nil] country
      # @attr [String, nil] date
      # @attr [String, nil] location
      # @attr [String, nil] postcode
      # @attr [String, nil] state
      class CarRentalPickupReturnData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :address

        attr_accessor :city

        attr_accessor :country

        attr_accessor :date

        attr_accessor :location

        attr_accessor :postcode

        attr_accessor :state

        # @return (Hash)
        def to_h
          hash = super
          hash['address'] = @address unless @address.nil?
          hash['city'] = @city unless @city.nil?
          hash['country'] = @country unless @country.nil?
          hash['date'] = @date unless @date.nil?
          hash['location'] = @location unless @location.nil?
          hash['postcode'] = @postcode unless @postcode.nil?
          hash['state'] = @state unless @state.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'address'
            @address = hash['address']
          end
          if hash.has_key? 'city'
            @city = hash['city']
          end
          if hash.has_key? 'country'
            @country = hash['country']
          end
          if hash.has_key? 'date'
            @date = hash['date']
          end
          if hash.has_key? 'location'
            @location = hash['location']
          end
          if hash.has_key? 'postcode'
            @postcode = hash['postcode']
          end
          if hash.has_key? 'state'
            @state = hash['state']
          end
        end
      end
    end
  end
end
