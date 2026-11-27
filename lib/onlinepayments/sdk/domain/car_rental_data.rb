# frozen_string_literal: true

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
      # @attr [OnlinePayments::SDK::Domain::CarRentalPickupReturnData, nil] pickup_details
      # @attr [Integer, nil] rental_rate_amount
      # @attr [String, nil] rental_rate_type
      # @attr [String, nil] renter_name
      # @attr [OnlinePayments::SDK::Domain::CarRentalPickupReturnData, nil] return_details
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

        attr_accessor :pickup_details

        attr_accessor :rental_rate_amount

        attr_accessor :rental_rate_type

        attr_accessor :renter_name

        attr_accessor :return_details

        attr_accessor :tax_exempt_indicator

        attr_accessor :toll_free_number

        attr_accessor :vehicle

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(agreement_number: nil,
                       cardholder_notified: nil,
                       charges_amount: nil,
                       charges_category: nil,
                       distance_measure: nil,
                       distance_unit: nil,
                       driver_identification_number: nil,
                       driver_tax_number: nil,
                       pickup_details: nil,
                       rental_rate_amount: nil,
                       rental_rate_type: nil,
                       renter_name: nil,
                       return_details: nil,
                       tax_exempt_indicator: nil,
                       toll_free_number: nil,
                       vehicle: nil)
          super()
          @agreement_number = agreement_number
          @cardholder_notified = cardholder_notified
          @charges_amount = charges_amount
          @charges_category = charges_category
          @distance_measure = distance_measure
          @distance_unit = distance_unit
          @driver_identification_number = driver_identification_number
          @driver_tax_number = driver_tax_number
          @pickup_details = pickup_details
          @rental_rate_amount = rental_rate_amount
          @rental_rate_type = rental_rate_type
          @renter_name = renter_name
          @return_details = return_details
          @tax_exempt_indicator = tax_exempt_indicator
          @toll_free_number = toll_free_number
          @vehicle = vehicle
        end

        # Sets the property and returns this same instance.
        def with_agreement_number(value)
          @agreement_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_cardholder_notified(value)
          @cardholder_notified = value
          self
        end

        # Sets the property and returns this same instance.
        def with_charges_amount(value)
          @charges_amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_charges_category(value)
          @charges_category = value
          self
        end

        # Sets the property and returns this same instance.
        def with_distance_measure(value)
          @distance_measure = value
          self
        end

        # Sets the property and returns this same instance.
        def with_distance_unit(value)
          @distance_unit = value
          self
        end

        # Sets the property and returns this same instance.
        def with_driver_identification_number(value)
          @driver_identification_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_driver_tax_number(value)
          @driver_tax_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_pickup_details(value)
          @pickup_details = value
          self
        end

        # Sets the property and returns this same instance.
        def with_rental_rate_amount(value)
          @rental_rate_amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_rental_rate_type(value)
          @rental_rate_type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_renter_name(value)
          @renter_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_return_details(value)
          @return_details = value
          self
        end

        # Sets the property and returns this same instance.
        def with_tax_exempt_indicator(value)
          @tax_exempt_indicator = value
          self
        end

        # Sets the property and returns this same instance.
        def with_toll_free_number(value)
          @toll_free_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_vehicle(value)
          @vehicle = value
          self
        end

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
          hash['pickupDetails'] = @pickup_details.to_h unless @pickup_details.nil?
          hash['rentalRateAmount'] = @rental_rate_amount unless @rental_rate_amount.nil?
          hash['rentalRateType'] = @rental_rate_type unless @rental_rate_type.nil?
          hash['renterName'] = @renter_name unless @renter_name.nil?
          hash['returnDetails'] = @return_details.to_h unless @return_details.nil?
          hash['taxExemptIndicator'] = @tax_exempt_indicator unless @tax_exempt_indicator.nil?
          hash['tollFreeNumber'] = @toll_free_number unless @toll_free_number.nil?
          hash['vehicle'] = @vehicle.to_h unless @vehicle.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'agreementNumber'
            @agreement_number = hash['agreementNumber']
          end
          if hash.key? 'cardholderNotified'
            @cardholder_notified = hash['cardholderNotified']
          end
          if hash.key? 'chargesAmount'
            @charges_amount = hash['chargesAmount']
          end
          if hash.key? 'chargesCategory'
            @charges_category = hash['chargesCategory']
          end
          if hash.key? 'distanceMeasure'
            @distance_measure = hash['distanceMeasure']
          end
          if hash.key? 'distanceUnit'
            @distance_unit = hash['distanceUnit']
          end
          if hash.key? 'driverIdentificationNumber'
            @driver_identification_number = hash['driverIdentificationNumber']
          end
          if hash.key? 'driverTaxNumber'
            @driver_tax_number = hash['driverTaxNumber']
          end
          if hash.key? 'pickupDetails'
            raise TypeError, "value '#{hash['pickupDetails']}' is not a Hash" unless hash['pickupDetails'].is_a? Hash
            @pickup_details = OnlinePayments::SDK::Domain::CarRentalPickupReturnData.new_from_hash(hash['pickupDetails'])
          end
          if hash.key? 'rentalRateAmount'
            @rental_rate_amount = hash['rentalRateAmount']
          end
          if hash.key? 'rentalRateType'
            @rental_rate_type = hash['rentalRateType']
          end
          if hash.key? 'renterName'
            @renter_name = hash['renterName']
          end
          if hash.key? 'returnDetails'
            raise TypeError, "value '#{hash['returnDetails']}' is not a Hash" unless hash['returnDetails'].is_a? Hash
            @return_details = OnlinePayments::SDK::Domain::CarRentalPickupReturnData.new_from_hash(hash['returnDetails'])
          end
          if hash.key? 'taxExemptIndicator'
            @tax_exempt_indicator = hash['taxExemptIndicator']
          end
          if hash.key? 'tollFreeNumber'
            @toll_free_number = hash['tollFreeNumber']
          end
          if hash.key? 'vehicle'
            raise TypeError, "value '#{hash['vehicle']}' is not a Hash" unless hash['vehicle'].is_a? Hash
            @vehicle = OnlinePayments::SDK::Domain::CarRentalVehicleData.new_from_hash(hash['vehicle'])
          end
        end
      end
    end
  end
end
