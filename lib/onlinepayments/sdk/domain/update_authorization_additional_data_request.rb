#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/car_rental_data'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CarRentalData, nil] car_rental_data
      class UpdateAuthorizationAdditionalDataRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :car_rental_data

        # @return (Hash)
        def to_h
          hash = super
          hash['carRentalData'] = @car_rental_data.to_h unless @car_rental_data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'carRentalData'
            raise TypeError, "value '%s' is not a Hash" % [hash['carRentalData']] unless hash['carRentalData'].is_a? Hash
            @car_rental_data = OnlinePayments::SDK::Domain::CarRentalData.new_from_hash(hash['carRentalData'])
          end
        end
      end
    end
  end
end
