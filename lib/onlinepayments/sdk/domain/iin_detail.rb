#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] card_corporate_indicator
      # @attr [Date] card_effective_date
      # @attr [true/false] card_effective_date_indicator
      # @attr [String] card_pan_type
      # @attr [String] card_product_code
      # @attr [String] card_product_usage_label
      # @attr [String] card_scheme
      # @attr [String] card_type
      # @attr [String] country_code
      # @attr [true/false] is_allowed_in_context
      # @attr [String] issuer_code
      # @attr [String] issuer_name
      # @attr [String] issuing_country_code
      # @attr [Integer] pan_length_max
      # @attr [Integer] pan_length_min
      # @attr [true/false] pan_luhn_check
      # @attr [Integer] payment_product_id
      class IINDetail < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_corporate_indicator

        attr_accessor :card_effective_date

        attr_accessor :card_effective_date_indicator

        attr_accessor :card_pan_type

        attr_accessor :card_product_code

        attr_accessor :card_product_usage_label

        attr_accessor :card_scheme

        attr_accessor :card_type

        attr_accessor :country_code

        attr_accessor :is_allowed_in_context

        attr_accessor :issuer_code

        attr_accessor :issuer_name

        attr_accessor :issuing_country_code

        attr_accessor :pan_length_max

        attr_accessor :pan_length_min

        attr_accessor :pan_luhn_check

        attr_accessor :payment_product_id

        # @return (Hash)
        def to_h
          hash = super
          hash['cardCorporateIndicator'] = @card_corporate_indicator unless @card_corporate_indicator.nil?
          hash['cardEffectiveDate'] = @card_effective_date.iso8601 unless @card_effective_date.nil?
          hash['cardEffectiveDateIndicator'] = @card_effective_date_indicator unless @card_effective_date_indicator.nil?
          hash['cardPanType'] = @card_pan_type unless @card_pan_type.nil?
          hash['cardProductCode'] = @card_product_code unless @card_product_code.nil?
          hash['cardProductUsageLabel'] = @card_product_usage_label unless @card_product_usage_label.nil?
          hash['cardScheme'] = @card_scheme unless @card_scheme.nil?
          hash['cardType'] = @card_type unless @card_type.nil?
          hash['countryCode'] = @country_code unless @country_code.nil?
          hash['isAllowedInContext'] = @is_allowed_in_context unless @is_allowed_in_context.nil?
          hash['issuerCode'] = @issuer_code unless @issuer_code.nil?
          hash['issuerName'] = @issuer_name unless @issuer_name.nil?
          hash['issuingCountryCode'] = @issuing_country_code unless @issuing_country_code.nil?
          hash['panLengthMax'] = @pan_length_max unless @pan_length_max.nil?
          hash['panLengthMin'] = @pan_length_min unless @pan_length_min.nil?
          hash['panLuhnCheck'] = @pan_luhn_check unless @pan_luhn_check.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cardCorporateIndicator'
            @card_corporate_indicator = hash['cardCorporateIndicator']
          end
          if hash.has_key? 'cardEffectiveDate'
            @card_effective_date = Date.parse(hash['cardEffectiveDate'])
          end
          if hash.has_key? 'cardEffectiveDateIndicator'
            @card_effective_date_indicator = hash['cardEffectiveDateIndicator']
          end
          if hash.has_key? 'cardPanType'
            @card_pan_type = hash['cardPanType']
          end
          if hash.has_key? 'cardProductCode'
            @card_product_code = hash['cardProductCode']
          end
          if hash.has_key? 'cardProductUsageLabel'
            @card_product_usage_label = hash['cardProductUsageLabel']
          end
          if hash.has_key? 'cardScheme'
            @card_scheme = hash['cardScheme']
          end
          if hash.has_key? 'cardType'
            @card_type = hash['cardType']
          end
          if hash.has_key? 'countryCode'
            @country_code = hash['countryCode']
          end
          if hash.has_key? 'isAllowedInContext'
            @is_allowed_in_context = hash['isAllowedInContext']
          end
          if hash.has_key? 'issuerCode'
            @issuer_code = hash['issuerCode']
          end
          if hash.has_key? 'issuerName'
            @issuer_name = hash['issuerName']
          end
          if hash.has_key? 'issuingCountryCode'
            @issuing_country_code = hash['issuingCountryCode']
          end
          if hash.has_key? 'panLengthMax'
            @pan_length_max = hash['panLengthMax']
          end
          if hash.has_key? 'panLengthMin'
            @pan_length_min = hash['panLengthMin']
          end
          if hash.has_key? 'panLuhnCheck'
            @pan_luhn_check = hash['panLuhnCheck']
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
        end
      end
    end
  end
end
