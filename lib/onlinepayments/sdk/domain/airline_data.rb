#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/airline_flight_leg'
require 'onlinepayments/sdk/domain/airline_passenger'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
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
      class AirlineData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :agent_numeric_code

        attr_accessor :code

        # @deprecated This field is not used by any payment product Date of the Flight Format: YYYYMMDD
        attr_accessor :flight_date

        attr_accessor :flight_indicator

        attr_accessor :flight_legs

        attr_accessor :invoice_number

        # @deprecated Deprecated
        attr_accessor :is_e_ticket

        attr_accessor :is_restricted_ticket

        # @deprecated This field is not used by any payment product  * true - The payer is the ticket holder  * false - The payer is not the ticket holder
        attr_accessor :is_third_party

        attr_accessor :issue_date

        attr_accessor :merchant_customer_id

        # @deprecated This field is not used by any payment product Name of the airline
        attr_accessor :name

        # @deprecated Use passengers instead Name of passenger
        attr_accessor :passenger_name

        attr_accessor :passengers

        # @deprecated This field is not used by any payment product Place of issue For sales in the US the last two characters (pos 14-15) must be the US state code.
        attr_accessor :place_of_issue

        # @deprecated Use passengers instead.
        attr_accessor :pnr

        attr_accessor :point_of_sale

        # @deprecated This field is not used by any payment product City code of the point of sale
        attr_accessor :pos_city_code

        attr_accessor :ticket_currency

        # @deprecated This field is not used by any payment product Delivery method of the ticket
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
          hash['flightLegs'] = @flight_legs.collect{|val| val.to_h} unless @flight_legs.nil?
          hash['invoiceNumber'] = @invoice_number unless @invoice_number.nil?
          hash['isETicket'] = @is_e_ticket unless @is_e_ticket.nil?
          hash['isRestrictedTicket'] = @is_restricted_ticket unless @is_restricted_ticket.nil?
          hash['isThirdParty'] = @is_third_party unless @is_third_party.nil?
          hash['issueDate'] = @issue_date unless @issue_date.nil?
          hash['merchantCustomerId'] = @merchant_customer_id unless @merchant_customer_id.nil?
          hash['name'] = @name unless @name.nil?
          hash['passengerName'] = @passenger_name unless @passenger_name.nil?
          hash['passengers'] = @passengers.collect{|val| val.to_h} unless @passengers.nil?
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
          if hash.has_key? 'agentNumericCode'
            @agent_numeric_code = hash['agentNumericCode']
          end
          if hash.has_key? 'code'
            @code = hash['code']
          end
          if hash.has_key? 'flightDate'
            @flight_date = hash['flightDate']
          end
          if hash.has_key? 'flightIndicator'
            @flight_indicator = hash['flightIndicator']
          end
          if hash.has_key? 'flightLegs'
            raise TypeError, "value '%s' is not an Array" % [hash['flightLegs']] unless hash['flightLegs'].is_a? Array
            @flight_legs = []
            hash['flightLegs'].each do |e|
              @flight_legs << OnlinePayments::SDK::Domain::AirlineFlightLeg.new_from_hash(e)
            end
          end
          if hash.has_key? 'invoiceNumber'
            @invoice_number = hash['invoiceNumber']
          end
          if hash.has_key? 'isETicket'
            @is_e_ticket = hash['isETicket']
          end
          if hash.has_key? 'isRestrictedTicket'
            @is_restricted_ticket = hash['isRestrictedTicket']
          end
          if hash.has_key? 'isThirdParty'
            @is_third_party = hash['isThirdParty']
          end
          if hash.has_key? 'issueDate'
            @issue_date = hash['issueDate']
          end
          if hash.has_key? 'merchantCustomerId'
            @merchant_customer_id = hash['merchantCustomerId']
          end
          if hash.has_key? 'name'
            @name = hash['name']
          end
          if hash.has_key? 'passengerName'
            @passenger_name = hash['passengerName']
          end
          if hash.has_key? 'passengers'
            raise TypeError, "value '%s' is not an Array" % [hash['passengers']] unless hash['passengers'].is_a? Array
            @passengers = []
            hash['passengers'].each do |e|
              @passengers << OnlinePayments::SDK::Domain::AirlinePassenger.new_from_hash(e)
            end
          end
          if hash.has_key? 'placeOfIssue'
            @place_of_issue = hash['placeOfIssue']
          end
          if hash.has_key? 'pnr'
            @pnr = hash['pnr']
          end
          if hash.has_key? 'pointOfSale'
            @point_of_sale = hash['pointOfSale']
          end
          if hash.has_key? 'posCityCode'
            @pos_city_code = hash['posCityCode']
          end
          if hash.has_key? 'ticketCurrency'
            @ticket_currency = hash['ticketCurrency']
          end
          if hash.has_key? 'ticketDeliveryMethod'
            @ticket_delivery_method = hash['ticketDeliveryMethod']
          end
          if hash.has_key? 'ticketNumber'
            @ticket_number = hash['ticketNumber']
          end
          if hash.has_key? 'totalFare'
            @total_fare = hash['totalFare']
          end
          if hash.has_key? 'totalFee'
            @total_fee = hash['totalFee']
          end
          if hash.has_key? 'totalTaxes'
            @total_taxes = hash['totalTaxes']
          end
          if hash.has_key? 'travelAgencyName'
            @travel_agency_name = hash['travelAgencyName']
          end
        end
      end
    end
  end
end
