#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] birth_city
      # @attr [String, nil] birth_country
      # @attr [String, nil] birth_zip_code
      # @attr [String, nil] channel
      # @attr [String, nil] loyalty_card_number
      # @attr [String, nil] second_installment_payment_date
      # @attr [Integer, nil] session_duration
      # @attr [String, nil] title
      # @attr [DateTime, nil] transaction_expiration_date_time
      class RedirectPaymentProduct5300SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :birth_city

        attr_accessor :birth_country

        attr_accessor :birth_zip_code

        attr_accessor :channel

        attr_accessor :loyalty_card_number

        attr_accessor :second_installment_payment_date

        attr_accessor :session_duration

        attr_accessor :title

        attr_accessor :transaction_expiration_date_time

        # Sets the property and returns this same instance.
        def with_birth_city(value)
          @birth_city = value
          self
        end

        # Sets the property and returns this same instance.
        def with_birth_country(value)
          @birth_country = value
          self
        end

        # Sets the property and returns this same instance.
        def with_birth_zip_code(value)
          @birth_zip_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_channel(value)
          @channel = value
          self
        end

        # Sets the property and returns this same instance.
        def with_loyalty_card_number(value)
          @loyalty_card_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_second_installment_payment_date(value)
          @second_installment_payment_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_session_duration(value)
          @session_duration = value
          self
        end

        # Sets the property and returns this same instance.
        def with_title(value)
          @title = value
          self
        end

        # Sets the property and returns this same instance.
        def with_transaction_expiration_date_time(value)
          @transaction_expiration_date_time = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['birthCity'] = @birth_city unless @birth_city.nil?
          hash['birthCountry'] = @birth_country unless @birth_country.nil?
          hash['birthZipCode'] = @birth_zip_code unless @birth_zip_code.nil?
          hash['channel'] = @channel unless @channel.nil?
          hash['loyaltyCardNumber'] = @loyalty_card_number unless @loyalty_card_number.nil?
          hash['secondInstallmentPaymentDate'] = @second_installment_payment_date unless @second_installment_payment_date.nil?
          hash['sessionDuration'] = @session_duration unless @session_duration.nil?
          hash['title'] = @title unless @title.nil?
          hash['transactionExpirationDateTime'] = @transaction_expiration_date_time.iso8601(3) unless @transaction_expiration_date_time.nil?
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
            @second_installment_payment_date = hash['secondInstallmentPaymentDate']
          end
          if hash.has_key? 'sessionDuration'
            @session_duration = hash['sessionDuration']
          end
          if hash.has_key? 'title'
            @title = hash['title']
          end
          if hash.has_key? 'transactionExpirationDateTime'
            @transaction_expiration_date_time = DateTime.parse(hash['transactionExpirationDateTime'])
          end
        end
      end
    end
  end
end
