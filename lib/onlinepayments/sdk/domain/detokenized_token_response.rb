#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] card_brand
      # @attr [String] card_expiry_date
      # @attr [String] card_holder_name
      # @attr [String] encrypted_card_number
      # @attr [String] payment_id
      # @attr [String] scheme_reference_data
      # @attr [String] token
      class DetokenizedTokenResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_brand

        attr_accessor :card_expiry_date

        attr_accessor :card_holder_name

        attr_accessor :encrypted_card_number

        attr_accessor :payment_id

        attr_accessor :scheme_reference_data

        attr_accessor :token

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
