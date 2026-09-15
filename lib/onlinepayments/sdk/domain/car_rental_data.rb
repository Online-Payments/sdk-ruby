#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/car_rental_pickup_return_data'
require 'onlinepayments/sdk/domain/car_rental_vehicle_data'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] agreement_number
      # @attr [true/false, nil] cardholder_notified
      # @attr [Integer, nil] charges_amount
      # @attr [String, nil] charges_category
      # @attr [Integer, nil] distance_measure
      # @attr [String, nil] distance_unit
      # @attr [String, nil] driver_identification_number
      # @attr [String, nil] driver_tax_number
      # @attr [OnlinePayments::SDK::Domain::CarRentalPickupReturnData, nil] pickup
      # @attr [Integer, nil] rental_rate_amount
      # @attr [String, nil] rental_rate_type
      # @attr [String, nil] renter_name
      # @attr [OnlinePayments::SDK::Domain::CarRentalPickupReturnData, nil] return
      # @attr [true/false, nil] tax_exempt_indicator
      # @attr [String, nil] toll_free_number
      # @attr [OnlinePayments::SDK::Domain::CarRentalVehicleData, nil] vehicle
      class CarRentalData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :agreement_number

        attr_accessor :cardholder_notified

        attr_accessor :charges_amount

        attr_accessor :charges_category

        attr_accessor :distance_measure

        attr_accessor :distance_unit

        attr_accessor :driver_identification_number

        attr_accessor :driver_tax_number

        attr_accessor :pickup

        attr_accessor :rental_rate_amount

        attr_accessor :rental_rate_type

        attr_accessor :renter_name

        attr_accessor :return

        attr_accessor :tax_exempt_indicator

        attr_accessor :toll_free_number

        attr_accessor :vehicle

        # @return (Hash)
        def to_h
          hash = super
          hash['agreementNumber'] = @agreement_number unless @agreement_number.nil?
          hash['cardholderNotified'] = @cardholder_notified unless @cardholder_notified.nil?
          hash['chargesAmount'] = @charges_amount unless @charges_amount.nil?
          hash['chargesCategory'] = @charges_category unless @charges_category.nil?
          hash['distanceMeasure'] = @distance_measure unless @distance_measure.nil?
          hash['distanceUnit'] = @distance_unit unless @distance_unit.nil?
          hash['driverIdentificationNumber'] = @driver_identification_number unless @driver_identification_number.nil?
          hash['driverTaxNumber'] = @driver_tax_number unless @driver_tax_number.nil?
          hash['pickup'] = @pickup.to_h unless @pickup.nil?
          hash['rentalRateAmount'] = @rental_rate_amount unless @rental_rate_amount.nil?
          hash['rentalRateType'] = @rental_rate_type unless @rental_rate_type.nil?
          hash['renterName'] = @renter_name unless @renter_name.nil?
          hash['return'] = @return.to_h unless @return.nil?
          hash['taxExemptIndicator'] = @tax_exempt_indicator unless @tax_exempt_indicator.nil?
          hash['tollFreeNumber'] = @toll_free_number unless @toll_free_number.nil?
          hash['vehicle'] = @vehicle.to_h unless @vehicle.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'agreementNumber'
            @agreement_number = hash['agreementNumber']
          end
          if hash.has_key? 'cardholderNotified'
            @cardholder_notified = hash['cardholderNotified']
          end
          if hash.has_key? 'chargesAmount'
            @charges_amount = hash['chargesAmount']
          end
          if hash.has_key? 'chargesCategory'
            @charges_category = hash['chargesCategory']
          end
          if hash.has_key? 'distanceMeasure'
            @distance_measure = hash['distanceMeasure']
          end
          if hash.has_key? 'distanceUnit'
            @distance_unit = hash['distanceUnit']
          end
          if hash.has_key? 'driverIdentificationNumber'
            @driver_identification_number = hash['driverIdentificationNumber']
          end
          if hash.has_key? 'driverTaxNumber'
            @driver_tax_number = hash['driverTaxNumber']
          end
          if hash.has_key? 'pickup'
            raise TypeError, "value '%s' is not a Hash" % [hash['pickup']] unless hash['pickup'].is_a? Hash
            @pickup = OnlinePayments::SDK::Domain::CarRentalPickupReturnData.new_from_hash(hash['pickup'])
          end
          if hash.has_key? 'rentalRateAmount'
            @rental_rate_amount = hash['rentalRateAmount']
          end
          if hash.has_key? 'rentalRateType'
            @rental_rate_type = hash['rentalRateType']
          end
          if hash.has_key? 'renterName'
            @renter_name = hash['renterName']
          end
          if hash.has_key? 'return'
            raise TypeError, "value '%s' is not a Hash" % [hash['return']] unless hash['return'].is_a? Hash
            @return = OnlinePayments::SDK::Domain::CarRentalPickupReturnData.new_from_hash(hash['return'])
          end
          if hash.has_key? 'taxExemptIndicator'
            @tax_exempt_indicator = hash['taxExemptIndicator']
          end
          if hash.has_key? 'tollFreeNumber'
            @toll_free_number = hash['tollFreeNumber']
          end
          if hash.has_key? 'vehicle'
            raise TypeError, "value '%s' is not a Hash" % [hash['vehicle']] unless hash['vehicle'].is_a? Hash
            @vehicle = OnlinePayments::SDK::Domain::CarRentalVehicleData.new_from_hash(hash['vehicle'])
          end
        end
      end
    end
  end
end
