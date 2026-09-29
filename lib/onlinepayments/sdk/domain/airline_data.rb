#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/airline_flight_leg'
require 'onlinepayments/sdk/domain/airline_passenger'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] agent_numeric_code
      # @attr [String, nil] code
      # @attr [String, nil] flight_date
      # @attr [String, nil] flight_indicator
      # @attr [Array<OnlinePayments::SDK::Domain::AirlineFlightLeg>, nil] flight_legs
      # @attr [String, nil] invoice_number
      # @attr [true/false, nil] is_e_ticket
      # @attr [true/false, nil] is_restricted_ticket
      # @attr [true/false, nil] is_third_party
      # @attr [String, nil] issue_date
      # @attr [String, nil] merchant_customer_id
      # @attr [String, nil] name
      # @attr [String, nil] passenger_name
      # @attr [Array<OnlinePayments::SDK::Domain::AirlinePassenger>, nil] passengers
      # @attr [String, nil] place_of_issue
      # @attr [String, nil] pnr
      # @attr [String, nil] point_of_sale
      # @attr [String, nil] pos_city_code
      # @attr [String, nil] ticket_currency
      # @attr [String, nil] ticket_delivery_method
      # @attr [String, nil] ticket_number
      # @attr [Integer, nil] total_fare
      # @attr [Integer, nil] total_fee
      # @attr [Integer, nil] total_taxes
      # @attr [String, nil] travel_agency_name
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

        # Sets the property and returns this same instance.
        def with_agent_numeric_code(value)
          @agent_numeric_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_code(value)
          @code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_flight_date(value)
          @flight_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_flight_indicator(value)
          @flight_indicator = value
          self
        end

        # Sets the property and returns this same instance.
        def with_flight_legs(value)
          @flight_legs = value
          self
        end

        # Sets the property and returns this same instance.
        def with_invoice_number(value)
          @invoice_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_e_ticket(value)
          @is_e_ticket = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_restricted_ticket(value)
          @is_restricted_ticket = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_third_party(value)
          @is_third_party = value
          self
        end

        # Sets the property and returns this same instance.
        def with_issue_date(value)
          @issue_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_merchant_customer_id(value)
          @merchant_customer_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_name(value)
          @name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_passenger_name(value)
          @passenger_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_passengers(value)
          @passengers = value
          self
        end

        # Sets the property and returns this same instance.
        def with_place_of_issue(value)
          @place_of_issue = value
          self
        end

        # Sets the property and returns this same instance.
        def with_pnr(value)
          @pnr = value
          self
        end

        # Sets the property and returns this same instance.
        def with_point_of_sale(value)
          @point_of_sale = value
          self
        end

        # Sets the property and returns this same instance.
        def with_pos_city_code(value)
          @pos_city_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_ticket_currency(value)
          @ticket_currency = value
          self
        end

        # Sets the property and returns this same instance.
        def with_ticket_delivery_method(value)
          @ticket_delivery_method = value
          self
        end

        # Sets the property and returns this same instance.
        def with_ticket_number(value)
          @ticket_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_total_fare(value)
          @total_fare = value
          self
        end

        # Sets the property and returns this same instance.
        def with_total_fee(value)
          @total_fee = value
          self
        end

        # Sets the property and returns this same instance.
        def with_total_taxes(value)
          @total_taxes = value
          self
        end

        # Sets the property and returns this same instance.
        def with_travel_agency_name(value)
          @travel_agency_name = value
          self
        end

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
