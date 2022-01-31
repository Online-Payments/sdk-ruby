#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] city
    # @attr [String] country_code
    # @attr [String] house_number
    # @attr [String] street
    # @attr [String] zip
    class MandateAddress < OnlinePayments::SDK::DataObject
      attr_accessor :city
      attr_accessor :country_code
      attr_accessor :house_number
      attr_accessor :street
      attr_accessor :zip

      # @return (Hash)
      def to_h
        hash = super
        hash['city'] = @city unless @city.nil?
        hash['countryCode'] = @country_code unless @country_code.nil?
        hash['houseNumber'] = @house_number unless @house_number.nil?
        hash['street'] = @street unless @street.nil?
        hash['zip'] = @zip unless @zip.nil?
        hash
      end

      def from_hash(hash)
        super
        @city = hash['city'] if hash.key? 'city'
        @country_code = hash['countryCode'] if hash.key? 'countryCode'
        @house_number = hash['houseNumber'] if hash.key? 'houseNumber'
        @street = hash['street'] if hash.key? 'street'
        @zip = hash['zip'] if hash.key? 'zip'
      end
    end
  end
end
