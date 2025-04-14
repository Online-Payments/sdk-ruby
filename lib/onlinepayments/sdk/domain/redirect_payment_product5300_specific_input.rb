#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] birth_city
      # @attr [String] birth_country
      # @attr [String] birth_zip_code
      # @attr [String] channel
      # @attr [String] loyalty_card_number
      # @attr [Date] second_installment_payment_date
      # @attr [Integer] session_duration
      class RedirectPaymentProduct5300SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :birth_city

        attr_accessor :birth_country

        attr_accessor :birth_zip_code

        attr_accessor :channel

        attr_accessor :loyalty_card_number

        attr_accessor :second_installment_payment_date

        attr_accessor :session_duration

        # @return (Hash)
        def to_h
          hash = super
          hash['birthCity'] = @birth_city unless @birth_city.nil?
          hash['birthCountry'] = @birth_country unless @birth_country.nil?
          hash['birthZipCode'] = @birth_zip_code unless @birth_zip_code.nil?
          hash['channel'] = @channel unless @channel.nil?
          hash['loyaltyCardNumber'] = @loyalty_card_number unless @loyalty_card_number.nil?
          hash['secondInstallmentPaymentDate'] = @second_installment_payment_date.iso8601 unless @second_installment_payment_date.nil?
          hash['sessionDuration'] = @session_duration unless @session_duration.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'birthCity'
            @birth_city = hash['birthCity']
          end
          if hash.has_key? 'birthCountry'
            @birth_country = hash['birthCountry']
          end
          if hash.has_key? 'birthZipCode'
            @birth_zip_code = hash['birthZipCode']
          end
          if hash.has_key? 'channel'
            @channel = hash['channel']
          end
          if hash.has_key? 'loyaltyCardNumber'
            @loyalty_card_number = hash['loyaltyCardNumber']
          end
          if hash.has_key? 'secondInstallmentPaymentDate'
            @second_installment_payment_date = Date.parse(hash['secondInstallmentPaymentDate'])
          end
          if hash.has_key? 'sessionDuration'
            @session_duration = hash['sessionDuration']
          end
        end
      end
    end
  end
end
