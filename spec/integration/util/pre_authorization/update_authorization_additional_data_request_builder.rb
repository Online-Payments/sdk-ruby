require 'onlinepayments/sdk/domain/car_rental_data'
require 'onlinepayments/sdk/domain/car_rental_pickup_return_data'
require 'onlinepayments/sdk/domain/car_rental_vehicle_data'
require 'onlinepayments/sdk/domain/update_authorization_additional_data_request'

module Integration
  module Util
    module PreAuthorization
      class UpdateAuthorizationAdditionalDataRequestBuilder

        def initialize
          @charges_category = 'gas'
          @minimal = false
        end

        def with_charges_category(charges_category)
          @charges_category = charges_category
          self
        end

        def with_minimal_car_rental_data
          @minimal = true
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::UpdateAuthorizationAdditionalDataRequest.new
          request.car_rental_data = @minimal ? build_minimal_car_rental_data : build_full_car_rental_data
          request
        end

        private

        def build_minimal_car_rental_data
          car_rental_data = OnlinePayments::SDK::Domain::CarRentalData.new
          car_rental_data.agreement_number = 'A1234567'
          car_rental_data.charges_amount = 0
          car_rental_data.charges_category = @charges_category
          car_rental_data.pickup_details = build_pickup_return_details('2026-09-28T090000.000Z')
          car_rental_data.return_details = build_pickup_return_details('2026-09-30T090000.000Z')
          car_rental_data.rental_rate_amount = 1000
          car_rental_data.rental_rate_type = 'daily'
          car_rental_data.renter_name = 'Wile E. Coyote'
          car_rental_data
        end

        def build_full_car_rental_data
          vehicle = OnlinePayments::SDK::Domain::CarRentalVehicleData.new
          vehicle.class_id = 'CDMR'
          vehicle.identification_number = 'VIN123456'

          car_rental_data = build_minimal_car_rental_data
          car_rental_data.cardholder_notified = true
          car_rental_data.distance_measure = 250
          car_rental_data.distance_unit = 'kilometers'
          car_rental_data.driver_identification_number = 'DRV123456'
          car_rental_data.driver_tax_number = 'BE0123456789'
          car_rental_data.tax_exempt_indicator = false
          car_rental_data.toll_free_number = '0800123456'
          car_rental_data.vehicle = vehicle
          car_rental_data
        end

        def build_pickup_return_details(date)
          details = OnlinePayments::SDK::Domain::CarRentalPickupReturnData.new
          details.address = 'Da Vincilaan 3'
          details.city = 'Brussels'
          details.country = 56
          details.date = date
          details.location = 'Brussels Airport'
          details.postcode = '1930'
          details.state = 'Flemish Brabant'
          details
        end
      end
    end
  end
end
