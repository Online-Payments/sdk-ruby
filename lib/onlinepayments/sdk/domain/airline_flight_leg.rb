# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] airline_class
      # @attr [String, nil] arrival_airport
      # @attr [String, nil] arrival_time
      # @attr [String, nil] carrier_code
      # @attr [String, nil] conjunction_ticket
      # @attr [String, nil] coupon_number
      # @attr [String, nil] date
      # @attr [String, nil] departure_time
      # @attr [String, nil] endorsement_or_restriction
      # @attr [String, nil] exchange_ticket
      # @attr [String, nil] fare
      # @attr [String, nil] fare_basis
      # @attr [Integer, nil] fee
      # @attr [String, nil] flight_code
      # @attr [String, nil] flight_number
      # @attr [Integer, nil] leg_fare
      # @attr [Integer, nil] number
      # @attr [String, nil] origin_airport
      # @attr [String, nil] passenger_class
      # @attr [String, nil] stopover_code
      # @attr [Integer, nil] taxes
      class AirlineFlightLeg < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :airline_class

        attr_accessor :arrival_airport

        attr_accessor :arrival_time

        attr_accessor :carrier_code

        attr_accessor :conjunction_ticket

        attr_accessor :coupon_number

        attr_accessor :date

        attr_accessor :departure_time

        attr_accessor :endorsement_or_restriction

        attr_accessor :exchange_ticket

        # @deprecated Use legFare instead. Fare of this leg
        attr_accessor :fare

        attr_accessor :fare_basis

        attr_accessor :fee

        attr_accessor :flight_code

        attr_accessor :flight_number

        attr_accessor :leg_fare

        # @deprecated This field is not used by any payment product Sequence number of the flight leg
        attr_accessor :number

        attr_accessor :origin_airport

        attr_accessor :passenger_class

        attr_accessor :stopover_code

        attr_accessor :taxes

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(airline_class: nil,
                       arrival_airport: nil,
                       arrival_time: nil,
                       carrier_code: nil,
                       conjunction_ticket: nil,
                       coupon_number: nil,
                       date: nil,
                       departure_time: nil,
                       endorsement_or_restriction: nil,
                       exchange_ticket: nil,
                       fare: nil,
                       fare_basis: nil,
                       fee: nil,
                       flight_code: nil,
                       flight_number: nil,
                       leg_fare: nil,
                       number: nil,
                       origin_airport: nil,
                       passenger_class: nil,
                       stopover_code: nil,
                       taxes: nil)
          super()
          @airline_class = airline_class
          @arrival_airport = arrival_airport
          @arrival_time = arrival_time
          @carrier_code = carrier_code
          @conjunction_ticket = conjunction_ticket
          @coupon_number = coupon_number
          @date = date
          @departure_time = departure_time
          @endorsement_or_restriction = endorsement_or_restriction
          @exchange_ticket = exchange_ticket
          @fare = fare
          @fare_basis = fare_basis
          @fee = fee
          @flight_code = flight_code
          @flight_number = flight_number
          @leg_fare = leg_fare
          @number = number
          @origin_airport = origin_airport
          @passenger_class = passenger_class
          @stopover_code = stopover_code
          @taxes = taxes
        end

        # Sets the property and returns this same instance.
        def with_airline_class(value)
          @airline_class = value
          self
        end

        # Sets the property and returns this same instance.
        def with_arrival_airport(value)
          @arrival_airport = value
          self
        end

        # Sets the property and returns this same instance.
        def with_arrival_time(value)
          @arrival_time = value
          self
        end

        # Sets the property and returns this same instance.
        def with_carrier_code(value)
          @carrier_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_conjunction_ticket(value)
          @conjunction_ticket = value
          self
        end

        # Sets the property and returns this same instance.
        def with_coupon_number(value)
          @coupon_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_date(value)
          @date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_departure_time(value)
          @departure_time = value
          self
        end

        # Sets the property and returns this same instance.
        def with_endorsement_or_restriction(value)
          @endorsement_or_restriction = value
          self
        end

        # Sets the property and returns this same instance.
        def with_exchange_ticket(value)
          @exchange_ticket = value
          self
        end

        # Sets the property and returns this same instance.
        def with_fare(value)
          @fare = value
          self
        end

        # Sets the property and returns this same instance.
        def with_fare_basis(value)
          @fare_basis = value
          self
        end

        # Sets the property and returns this same instance.
        def with_fee(value)
          @fee = value
          self
        end

        # Sets the property and returns this same instance.
        def with_flight_code(value)
          @flight_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_flight_number(value)
          @flight_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_leg_fare(value)
          @leg_fare = value
          self
        end

        # Sets the property and returns this same instance.
        def with_number(value)
          @number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_origin_airport(value)
          @origin_airport = value
          self
        end

        # Sets the property and returns this same instance.
        def with_passenger_class(value)
          @passenger_class = value
          self
        end

        # Sets the property and returns this same instance.
        def with_stopover_code(value)
          @stopover_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_taxes(value)
          @taxes = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['airlineClass'] = @airline_class unless @airline_class.nil?
          hash['arrivalAirport'] = @arrival_airport unless @arrival_airport.nil?
          hash['arrivalTime'] = @arrival_time unless @arrival_time.nil?
          hash['carrierCode'] = @carrier_code unless @carrier_code.nil?
          hash['conjunctionTicket'] = @conjunction_ticket unless @conjunction_ticket.nil?
          hash['couponNumber'] = @coupon_number unless @coupon_number.nil?
          hash['date'] = @date unless @date.nil?
          hash['departureTime'] = @departure_time unless @departure_time.nil?
          hash['endorsementOrRestriction'] = @endorsement_or_restriction unless @endorsement_or_restriction.nil?
          hash['exchangeTicket'] = @exchange_ticket unless @exchange_ticket.nil?
          hash['fare'] = @fare unless @fare.nil?
          hash['fareBasis'] = @fare_basis unless @fare_basis.nil?
          hash['fee'] = @fee unless @fee.nil?
          hash['flightCode'] = @flight_code unless @flight_code.nil?
          hash['flightNumber'] = @flight_number unless @flight_number.nil?
          hash['legFare'] = @leg_fare unless @leg_fare.nil?
          hash['number'] = @number unless @number.nil?
          hash['originAirport'] = @origin_airport unless @origin_airport.nil?
          hash['passengerClass'] = @passenger_class unless @passenger_class.nil?
          hash['stopoverCode'] = @stopover_code unless @stopover_code.nil?
          hash['taxes'] = @taxes unless @taxes.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'airlineClass'
            @airline_class = hash['airlineClass']
          end
          if hash.key? 'arrivalAirport'
            @arrival_airport = hash['arrivalAirport']
          end
          if hash.key? 'arrivalTime'
            @arrival_time = hash['arrivalTime']
          end
          if hash.key? 'carrierCode'
            @carrier_code = hash['carrierCode']
          end
          if hash.key? 'conjunctionTicket'
            @conjunction_ticket = hash['conjunctionTicket']
          end
          if hash.key? 'couponNumber'
            @coupon_number = hash['couponNumber']
          end
          if hash.key? 'date'
            @date = hash['date']
          end
          if hash.key? 'departureTime'
            @departure_time = hash['departureTime']
          end
          if hash.key? 'endorsementOrRestriction'
            @endorsement_or_restriction = hash['endorsementOrRestriction']
          end
          if hash.key? 'exchangeTicket'
            @exchange_ticket = hash['exchangeTicket']
          end
          if hash.key? 'fare'
            @fare = hash['fare']
          end
          if hash.key? 'fareBasis'
            @fare_basis = hash['fareBasis']
          end
          if hash.key? 'fee'
            @fee = hash['fee']
          end
          if hash.key? 'flightCode'
            @flight_code = hash['flightCode']
          end
          if hash.key? 'flightNumber'
            @flight_number = hash['flightNumber']
          end
          if hash.key? 'legFare'
            @leg_fare = hash['legFare']
          end
          if hash.key? 'number'
            @number = hash['number']
          end
          if hash.key? 'originAirport'
            @origin_airport = hash['originAirport']
          end
          if hash.key? 'passengerClass'
            @passenger_class = hash['passengerClass']
          end
          if hash.key? 'stopoverCode'
            @stopover_code = hash['stopoverCode']
          end
          if hash.key? 'taxes'
            @taxes = hash['taxes']
          end
        end
      end
    end
  end
end
