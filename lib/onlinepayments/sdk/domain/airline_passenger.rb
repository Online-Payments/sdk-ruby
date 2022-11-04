#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] airline_loyalty_status
    # @attr [String] first_name
    # @attr [String] passenger_type
    # @attr [String] surname
    # @attr [String] surname_prefix
    # @attr [String] title
    class AirlinePassenger < OnlinePayments::SDK::DataObject
      attr_accessor :airline_loyalty_status
      attr_accessor :first_name
      attr_accessor :passenger_type
      attr_accessor :surname
      attr_accessor :surname_prefix
      attr_accessor :title

      # @return (Hash)
      def to_h
        hash = super
        hash['airlineLoyaltyStatus'] = @airline_loyalty_status unless @airline_loyalty_status.nil?
        hash['firstName'] = @first_name unless @first_name.nil?
        hash['passengerType'] = @passenger_type unless @passenger_type.nil?
        hash['surname'] = @surname unless @surname.nil?
        hash['surnamePrefix'] = @surname_prefix unless @surname_prefix.nil?
        hash['title'] = @title unless @title.nil?
        hash
      end

      def from_hash(hash)
        super
        @airline_loyalty_status = hash['airlineLoyaltyStatus'] if hash.key? 'airlineLoyaltyStatus'
        @first_name = hash['firstName'] if hash.key? 'firstName'
        @passenger_type = hash['passengerType'] if hash.key? 'passengerType'
        @surname = hash['surname'] if hash.key? 'surname'
        @surname_prefix = hash['surnamePrefix'] if hash.key? 'surnamePrefix'
        @title = hash['title'] if hash.key? 'title'
      end
    end
  end
end
