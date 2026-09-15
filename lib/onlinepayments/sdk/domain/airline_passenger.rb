#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] airline_loyalty_status
      # @attr [String, nil] country_code
      # @attr [String, nil] date_of_birth
      # @attr [String, nil] first_name
      # @attr [String, nil] passenger_type
      # @attr [String, nil] surname
      # @attr [String, nil] surname_prefix
      # @attr [String, nil] title
      class AirlinePassenger < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :airline_loyalty_status

        attr_accessor :country_code

        attr_accessor :date_of_birth

        attr_accessor :first_name

        attr_accessor :passenger_type

        attr_accessor :surname

        attr_accessor :surname_prefix

        # @deprecated This field is not used by any payment product Title of the passenger (this property is used for fraud screening on the payment platform)
        attr_accessor :title

        # @return (Hash)
        def to_h
          hash = super
          hash['airlineLoyaltyStatus'] = @airline_loyalty_status unless @airline_loyalty_status.nil?
          hash['countryCode'] = @country_code unless @country_code.nil?
          hash['dateOfBirth'] = @date_of_birth unless @date_of_birth.nil?
          hash['firstName'] = @first_name unless @first_name.nil?
          hash['passengerType'] = @passenger_type unless @passenger_type.nil?
          hash['surname'] = @surname unless @surname.nil?
          hash['surnamePrefix'] = @surname_prefix unless @surname_prefix.nil?
          hash['title'] = @title unless @title.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'airlineLoyaltyStatus'
            @airline_loyalty_status = hash['airlineLoyaltyStatus']
          end
          if hash.has_key? 'countryCode'
            @country_code = hash['countryCode']
          end
          if hash.has_key? 'dateOfBirth'
            @date_of_birth = hash['dateOfBirth']
          end
          if hash.has_key? 'firstName'
            @first_name = hash['firstName']
          end
          if hash.has_key? 'passengerType'
            @passenger_type = hash['passengerType']
          end
          if hash.has_key? 'surname'
            @surname = hash['surname']
          end
          if hash.has_key? 'surnamePrefix'
            @surname_prefix = hash['surnamePrefix']
          end
          if hash.has_key? 'title'
            @title = hash['title']
          end
        end
      end
    end
  end
end
