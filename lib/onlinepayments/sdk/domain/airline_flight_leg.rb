#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] airline_class
    # @attr [String] arrival_airport
    # @attr [String] arrival_time
    # @attr [String] carrier_code
    # @attr [String] conjunction_ticket
    # @attr [String] coupon_number
    # @attr [String] date
    # @attr [String] departure_time
    # @attr [String] endorsement_or_restriction
    # @attr [String] exchange_ticket
    # @attr [String] fare
    # @attr [String] fare_basis
    # @attr [Integer] fee
    # @attr [String] flight_number
    # @attr [Integer] leg_fare
    # @attr [Integer] number
    # @attr [String] origin_airport
    # @attr [String] passenger_class
    # @attr [String] stopover_code
    # @attr [Integer] taxes
    class AirlineFlightLeg < OnlinePayments::SDK::DataObject
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
      attr_accessor :fare
      attr_accessor :fare_basis
      attr_accessor :fee
      attr_accessor :flight_number
      attr_accessor :leg_fare
      attr_accessor :number
      attr_accessor :origin_airport
      attr_accessor :passenger_class
      attr_accessor :stopover_code
      attr_accessor :taxes

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
        @airline_class = hash['airlineClass'] if hash.key? 'airlineClass'
        @arrival_airport = hash['arrivalAirport'] if hash.key? 'arrivalAirport'
        @arrival_time = hash['arrivalTime'] if hash.key? 'arrivalTime'
        @carrier_code = hash['carrierCode'] if hash.key? 'carrierCode'
        @conjunction_ticket = hash['conjunctionTicket'] if hash.key? 'conjunctionTicket'
        @coupon_number = hash['couponNumber'] if hash.key? 'couponNumber'
        @date = hash['date'] if hash.key? 'date'
        @departure_time = hash['departureTime'] if hash.key? 'departureTime'
        @endorsement_or_restriction = hash['endorsementOrRestriction'] if hash.key? 'endorsementOrRestriction'
        @exchange_ticket = hash['exchangeTicket'] if hash.key? 'exchangeTicket'
        @fare = hash['fare'] if hash.key? 'fare'
        @fare_basis = hash['fareBasis'] if hash.key? 'fareBasis'
        @fee = hash['fee'] if hash.key? 'fee'
        @flight_number = hash['flightNumber'] if hash.key? 'flightNumber'
        @leg_fare = hash['legFare'] if hash.key? 'legFare'
        @number = hash['number'] if hash.key? 'number'
        @origin_airport = hash['originAirport'] if hash.key? 'originAirport'
        @passenger_class = hash['passengerClass'] if hash.key? 'passengerClass'
        @stopover_code = hash['stopoverCode'] if hash.key? 'stopoverCode'
        @taxes = hash['taxes'] if hash.key? 'taxes'
      end
    end
  end
end
