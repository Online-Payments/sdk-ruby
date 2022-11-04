#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/airline_flight_leg'
require 'onlinepayments/sdk/domain/airline_passenger'

module OnlinePayments::SDK
  module Domain

    # @attr [String] agent_numeric_code
    # @attr [String] code
    # @attr [String] flight_date
    # @attr [String] flight_indicator
    # @attr [Array<OnlinePayments::SDK::Domain::AirlineFlightLeg>] flight_legs
    # @attr [String] invoice_number
    # @attr [true/false] is_e_ticket
    # @attr [true/false] is_restricted_ticket
    # @attr [true/false] is_third_party
    # @attr [String] issue_date
    # @attr [String] merchant_customer_id
    # @attr [String] name
    # @attr [String] passenger_name
    # @attr [Array<OnlinePayments::SDK::Domain::AirlinePassenger>] passengers
    # @attr [String] place_of_issue
    # @attr [String] pnr
    # @attr [String] point_of_sale
    # @attr [String] pos_city_code
    # @attr [String] ticket_currency
    # @attr [String] ticket_delivery_method
    # @attr [String] ticket_number
    # @attr [Integer] total_fare
    # @attr [Integer] total_fee
    # @attr [Integer] total_taxes
    # @attr [String] travel_agency_name
    class AirlineData < OnlinePayments::SDK::DataObject
      attr_accessor :agent_numeric_code
      attr_accessor :code
      attr_accessor :flight_date
      attr_accessor :flight_indicator
      attr_accessor :flight_legs
      attr_accessor :invoice_number
      attr_accessor :is_e_ticket
      attr_accessor :is_restricted_ticket
      attr_accessor :is_third_party
      attr_accessor :issue_date
      attr_accessor :merchant_customer_id
      attr_accessor :name
      attr_accessor :passenger_name
      attr_accessor :passengers
      attr_accessor :place_of_issue
      attr_accessor :pnr
      attr_accessor :point_of_sale
      attr_accessor :pos_city_code
      attr_accessor :ticket_currency
      attr_accessor :ticket_delivery_method
      attr_accessor :ticket_number
      attr_accessor :total_fare
      attr_accessor :total_fee
      attr_accessor :total_taxes
      attr_accessor :travel_agency_name

      # @return (Hash)
      def to_h
        hash = super
        hash['agentNumericCode'] = @agent_numeric_code unless @agent_numeric_code.nil?
        hash['code'] = @code unless @code.nil?
        hash['flightDate'] = @flight_date unless @flight_date.nil?
        hash['flightIndicator'] = @flight_indicator unless @flight_indicator.nil?
        hash['flightLegs'] = @flight_legs.collect(&:to_h) if @flight_legs
        hash['invoiceNumber'] = @invoice_number unless @invoice_number.nil?
        hash['isETicket'] = @is_e_ticket unless @is_e_ticket.nil?
        hash['isRestrictedTicket'] = @is_restricted_ticket unless @is_restricted_ticket.nil?
        hash['isThirdParty'] = @is_third_party unless @is_third_party.nil?
        hash['issueDate'] = @issue_date unless @issue_date.nil?
        hash['merchantCustomerId'] = @merchant_customer_id unless @merchant_customer_id.nil?
        hash['name'] = @name unless @name.nil?
        hash['passengerName'] = @passenger_name unless @passenger_name.nil?
        hash['passengers'] = @passengers.collect(&:to_h) if @passengers
        hash['placeOfIssue'] = @place_of_issue unless @place_of_issue.nil?
        hash['pnr'] = @pnr unless @pnr.nil?
        hash['pointOfSale'] = @point_of_sale unless @point_of_sale.nil?
        hash['posCityCode'] = @pos_city_code unless @pos_city_code.nil?
        hash['ticketCurrency'] = @ticket_currency unless @ticket_currency.nil?
        hash['ticketDeliveryMethod'] = @ticket_delivery_method unless @ticket_delivery_method.nil?
        hash['ticketNumber'] = @ticket_number unless @ticket_number.nil?
        hash['totalFare'] = @total_fare unless @total_fare.nil?
        hash['totalFee'] = @total_fee unless @total_fee.nil?
        hash['totalTaxes'] = @total_taxes unless @total_taxes.nil?
        hash['travelAgencyName'] = @travel_agency_name unless @travel_agency_name.nil?
        hash
      end

      def from_hash(hash)
        super
        @agent_numeric_code = hash['agentNumericCode'] if hash.key? 'agentNumericCode'
        @code = hash['code'] if hash.key? 'code'
        @flight_date = hash['flightDate'] if hash.key? 'flightDate'
        @flight_indicator = hash['flightIndicator'] if hash.key? 'flightIndicator'
        if hash.key? 'flightLegs'
          raise TypeError, "value '%s' is not an Array" % [hash['flightLegs']] unless hash['flightLegs'].is_a? Array
          @flight_legs = []
          hash['flightLegs'].each do |e|
            @flight_legs << OnlinePayments::SDK::Domain::AirlineFlightLeg.new_from_hash(e)
          end
        end
        @invoice_number = hash['invoiceNumber'] if hash.key? 'invoiceNumber'
        @is_e_ticket = hash['isETicket'] if hash.key? 'isETicket'
        @is_restricted_ticket = hash['isRestrictedTicket'] if hash.key? 'isRestrictedTicket'
        @is_third_party = hash['isThirdParty'] if hash.key? 'isThirdParty'
        @issue_date = hash['issueDate'] if hash.key? 'issueDate'
        @merchant_customer_id = hash['merchantCustomerId'] if hash.key? 'merchantCustomerId'
        @name = hash['name'] if hash.key? 'name'
        @passenger_name = hash['passengerName'] if hash.key? 'passengerName'
        if hash.key? 'passengers'
          raise TypeError, "value '%s' is not an Array" % [hash['passengers']] unless hash['passengers'].is_a? Array
          @passengers = []
          hash['passengers'].each do |e|
            @passengers << OnlinePayments::SDK::Domain::AirlinePassenger.new_from_hash(e)
          end
        end
        @place_of_issue = hash['placeOfIssue'] if hash.key? 'placeOfIssue'
        @pnr = hash['pnr'] if hash.key? 'pnr'
        @point_of_sale = hash['pointOfSale'] if hash.key? 'pointOfSale'
        @pos_city_code = hash['posCityCode'] if hash.key? 'posCityCode'
        @ticket_currency = hash['ticketCurrency'] if hash.key? 'ticketCurrency'
        @ticket_delivery_method = hash['ticketDeliveryMethod'] if hash.key? 'ticketDeliveryMethod'
        @ticket_number = hash['ticketNumber'] if hash.key? 'ticketNumber'
        @total_fare = hash['totalFare'] if hash.key? 'totalFare'
        @total_fee = hash['totalFee'] if hash.key? 'totalFee'
        @total_taxes = hash['totalTaxes'] if hash.key? 'totalTaxes'
        @travel_agency_name = hash['travelAgencyName'] if hash.key? 'travelAgencyName'
      end
    end
  end
end
