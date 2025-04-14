#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] bin
      # @attr [String] card_number
      # @attr [String] country_code
      # @attr [String] expiry_date
      class CardEssentials < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :bin

        attr_accessor :card_number

        attr_accessor :country_code

        attr_accessor :expiry_date

        # @return (Hash)
        def to_h
          hash = super
          hash['bin'] = @bin unless @bin.nil?
          hash['cardNumber'] = @card_number unless @card_number.nil?
          hash['countryCode'] = @country_code unless @country_code.nil?
          hash['expiryDate'] = @expiry_date unless @expiry_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'bin'
            @bin = hash['bin']
          end
          if hash.has_key? 'cardNumber'
            @card_number = hash['cardNumber']
          end
          if hash.has_key? 'countryCode'
            @country_code = hash['countryCode']
          end
          if hash.has_key? 'expiryDate'
            @expiry_date = hash['expiryDate']
          end
        end
      end
    end
  end
end
