# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] card_corporate_indicator
      # @attr [Date, nil] card_effective_date
      # @attr [true/false, nil] card_effective_date_indicator
      # @attr [String, nil] card_pan_type
      # @attr [String, nil] card_product_code
      # @attr [String, nil] card_product_name
      # @attr [String, nil] card_product_usage_label
      # @attr [String, nil] card_scheme
      # @attr [String, nil] card_type
      # @attr [String, nil] country_code
      # @attr [String, nil] issuer_code
      # @attr [String, nil] issuer_name
      # @attr [String, nil] issuer_principal_member_code
      # @attr [String, nil] issuer_principal_member_name
      # @attr [String, nil] issuer_region_code
      # @attr [String, nil] issuing_country_code
      # @attr [Integer, nil] pan_length_max
      # @attr [Integer, nil] pan_length_min
      # @attr [true/false, nil] pan_luhn_check
      # @attr [true/false, nil] virtual_card_indicator
      class CardBinDetails < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_corporate_indicator

        attr_accessor :card_effective_date

        attr_accessor :card_effective_date_indicator

        attr_accessor :card_pan_type

        attr_accessor :card_product_code

        attr_accessor :card_product_name

        attr_accessor :card_product_usage_label

        attr_accessor :card_scheme

        attr_accessor :card_type

        attr_accessor :country_code

        attr_accessor :issuer_code

        attr_accessor :issuer_name

        attr_accessor :issuer_principal_member_code

        attr_accessor :issuer_principal_member_name

        attr_accessor :issuer_region_code

        attr_accessor :issuing_country_code

        attr_accessor :pan_length_max

        attr_accessor :pan_length_min

        attr_accessor :pan_luhn_check

        attr_accessor :virtual_card_indicator

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(card_corporate_indicator: nil,
                       card_effective_date: nil,
                       card_effective_date_indicator: nil,
                       card_pan_type: nil,
                       card_product_code: nil,
                       card_product_name: nil,
                       card_product_usage_label: nil,
                       card_scheme: nil,
                       card_type: nil,
                       country_code: nil,
                       issuer_code: nil,
                       issuer_name: nil,
                       issuer_principal_member_code: nil,
                       issuer_principal_member_name: nil,
                       issuer_region_code: nil,
                       issuing_country_code: nil,
                       pan_length_max: nil,
                       pan_length_min: nil,
                       pan_luhn_check: nil,
                       virtual_card_indicator: nil)
          super()
          @card_corporate_indicator = card_corporate_indicator
          @card_effective_date = card_effective_date
          @card_effective_date_indicator = card_effective_date_indicator
          @card_pan_type = card_pan_type
          @card_product_code = card_product_code
          @card_product_name = card_product_name
          @card_product_usage_label = card_product_usage_label
          @card_scheme = card_scheme
          @card_type = card_type
          @country_code = country_code
          @issuer_code = issuer_code
          @issuer_name = issuer_name
          @issuer_principal_member_code = issuer_principal_member_code
          @issuer_principal_member_name = issuer_principal_member_name
          @issuer_region_code = issuer_region_code
          @issuing_country_code = issuing_country_code
          @pan_length_max = pan_length_max
          @pan_length_min = pan_length_min
          @pan_luhn_check = pan_luhn_check
          @virtual_card_indicator = virtual_card_indicator
        end

        # Sets the property and returns this same instance.
        def with_card_corporate_indicator(value)
          @card_corporate_indicator = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_effective_date(value)
          @card_effective_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_effective_date_indicator(value)
          @card_effective_date_indicator = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_pan_type(value)
          @card_pan_type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_product_code(value)
          @card_product_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_product_name(value)
          @card_product_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_product_usage_label(value)
          @card_product_usage_label = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_scheme(value)
          @card_scheme = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_type(value)
          @card_type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_country_code(value)
          @country_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_issuer_code(value)
          @issuer_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_issuer_name(value)
          @issuer_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_issuer_principal_member_code(value)
          @issuer_principal_member_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_issuer_principal_member_name(value)
          @issuer_principal_member_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_issuer_region_code(value)
          @issuer_region_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_issuing_country_code(value)
          @issuing_country_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_pan_length_max(value)
          @pan_length_max = value
          self
        end

        # Sets the property and returns this same instance.
        def with_pan_length_min(value)
          @pan_length_min = value
          self
        end

        # Sets the property and returns this same instance.
        def with_pan_luhn_check(value)
          @pan_luhn_check = value
          self
        end

        # Sets the property and returns this same instance.
        def with_virtual_card_indicator(value)
          @virtual_card_indicator = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['cardCorporateIndicator'] = @card_corporate_indicator unless @card_corporate_indicator.nil?
          hash['cardEffectiveDate'] = @card_effective_date.iso8601 unless @card_effective_date.nil?
          hash['cardEffectiveDateIndicator'] = @card_effective_date_indicator unless @card_effective_date_indicator.nil?
          hash['cardPanType'] = @card_pan_type unless @card_pan_type.nil?
          hash['cardProductCode'] = @card_product_code unless @card_product_code.nil?
          hash['cardProductName'] = @card_product_name unless @card_product_name.nil?
          hash['cardProductUsageLabel'] = @card_product_usage_label unless @card_product_usage_label.nil?
          hash['cardScheme'] = @card_scheme unless @card_scheme.nil?
          hash['cardType'] = @card_type unless @card_type.nil?
          hash['countryCode'] = @country_code unless @country_code.nil?
          hash['issuerCode'] = @issuer_code unless @issuer_code.nil?
          hash['issuerName'] = @issuer_name unless @issuer_name.nil?
          hash['issuerPrincipalMemberCode'] = @issuer_principal_member_code unless @issuer_principal_member_code.nil?
          hash['issuerPrincipalMemberName'] = @issuer_principal_member_name unless @issuer_principal_member_name.nil?
          hash['issuerRegionCode'] = @issuer_region_code unless @issuer_region_code.nil?
          hash['issuingCountryCode'] = @issuing_country_code unless @issuing_country_code.nil?
          hash['panLengthMax'] = @pan_length_max unless @pan_length_max.nil?
          hash['panLengthMin'] = @pan_length_min unless @pan_length_min.nil?
          hash['panLuhnCheck'] = @pan_luhn_check unless @pan_luhn_check.nil?
          hash['virtualCardIndicator'] = @virtual_card_indicator unless @virtual_card_indicator.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'cardCorporateIndicator'
            @card_corporate_indicator = hash['cardCorporateIndicator']
          end
          if hash.key? 'cardEffectiveDate'
            @card_effective_date = Date.parse(hash['cardEffectiveDate'])
          end
          if hash.key? 'cardEffectiveDateIndicator'
            @card_effective_date_indicator = hash['cardEffectiveDateIndicator']
          end
          if hash.key? 'cardPanType'
            @card_pan_type = hash['cardPanType']
          end
          if hash.key? 'cardProductCode'
            @card_product_code = hash['cardProductCode']
          end
          if hash.key? 'cardProductName'
            @card_product_name = hash['cardProductName']
          end
          if hash.key? 'cardProductUsageLabel'
            @card_product_usage_label = hash['cardProductUsageLabel']
          end
          if hash.key? 'cardScheme'
            @card_scheme = hash['cardScheme']
          end
          if hash.key? 'cardType'
            @card_type = hash['cardType']
          end
          if hash.key? 'countryCode'
            @country_code = hash['countryCode']
          end
          if hash.key? 'issuerCode'
            @issuer_code = hash['issuerCode']
          end
          if hash.key? 'issuerName'
            @issuer_name = hash['issuerName']
          end
          if hash.key? 'issuerPrincipalMemberCode'
            @issuer_principal_member_code = hash['issuerPrincipalMemberCode']
          end
          if hash.key? 'issuerPrincipalMemberName'
            @issuer_principal_member_name = hash['issuerPrincipalMemberName']
          end
          if hash.key? 'issuerRegionCode'
            @issuer_region_code = hash['issuerRegionCode']
          end
          if hash.key? 'issuingCountryCode'
            @issuing_country_code = hash['issuingCountryCode']
          end
          if hash.key? 'panLengthMax'
            @pan_length_max = hash['panLengthMax']
          end
          if hash.key? 'panLengthMin'
            @pan_length_min = hash['panLengthMin']
          end
          if hash.key? 'panLuhnCheck'
            @pan_luhn_check = hash['panLuhnCheck']
          end
          if hash.key? 'virtualCardIndicator'
            @virtual_card_indicator = hash['virtualCardIndicator']
          end
        end
      end
    end
  end
end
