#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] card_brand
      # @attr [String, nil] card_expiry_date
      # @attr [String, nil] card_holder_name
      # @attr [String, nil] encrypted_card_number
      # @attr [String, nil] payment_id
      # @attr [String, nil] scheme_reference_data
      # @attr [String, nil] token
      class DetokenizedTokenResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_brand

        attr_accessor :card_expiry_date

        attr_accessor :card_holder_name

        attr_accessor :encrypted_card_number

        attr_accessor :payment_id

        attr_accessor :scheme_reference_data

        attr_accessor :token

        # Sets the property and returns this same instance.
        def with_card_brand(value)
          @card_brand = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_expiry_date(value)
          @card_expiry_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_holder_name(value)
          @card_holder_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_encrypted_card_number(value)
          @encrypted_card_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_id(value)
          @payment_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_scheme_reference_data(value)
          @scheme_reference_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_token(value)
          @token = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['cardBrand'] = @card_brand unless @card_brand.nil?
          hash['cardExpiryDate'] = @card_expiry_date unless @card_expiry_date.nil?
          hash['cardHolderName'] = @card_holder_name unless @card_holder_name.nil?
          hash['encryptedCardNumber'] = @encrypted_card_number unless @encrypted_card_number.nil?
          hash['paymentId'] = @payment_id unless @payment_id.nil?
          hash['schemeReferenceData'] = @scheme_reference_data unless @scheme_reference_data.nil?
          hash['token'] = @token unless @token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cardBrand'
            @card_brand = hash['cardBrand']
          end
          if hash.has_key? 'cardExpiryDate'
            @card_expiry_date = hash['cardExpiryDate']
          end
          if hash.has_key? 'cardHolderName'
            @card_holder_name = hash['cardHolderName']
          end
          if hash.has_key? 'encryptedCardNumber'
            @encrypted_card_number = hash['encryptedCardNumber']
          end
          if hash.has_key? 'paymentId'
            @payment_id = hash['paymentId']
          end
          if hash.has_key? 'schemeReferenceData'
            @scheme_reference_data = hash['schemeReferenceData']
          end
          if hash.has_key? 'token'
            @token = hash['token']
          end
        end
      end
    end
  end
end
