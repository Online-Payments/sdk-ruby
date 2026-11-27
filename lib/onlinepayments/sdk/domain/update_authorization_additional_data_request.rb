# frozen_string_literal: true

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

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(car_rental_data: nil)
          super()
          @car_rental_data = car_rental_data
        end

        # Sets the property and returns this same instance.
        def with_car_rental_data(value)
          @car_rental_data = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['carRentalData'] = @car_rental_data.to_h unless @car_rental_data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'carRentalData'
            raise TypeError, "value '#{hash['carRentalData']}' is not a Hash" unless hash['carRentalData'].is_a? Hash
            @car_rental_data = OnlinePayments::SDK::Domain::CarRentalData.new_from_hash(hash['carRentalData'])
          end
        end
      end
    end
  end
end
