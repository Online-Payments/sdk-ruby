# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [float, nil] ad_valorem_rate
      # @attr [Integer, nil] specific_rate
      # @attr [String, nil] surcharge_product_type_id
      # @attr [String, nil] surcharge_product_type_version
      class SurchargeRate < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :ad_valorem_rate

        attr_accessor :specific_rate

        attr_accessor :surcharge_product_type_id

        attr_accessor :surcharge_product_type_version

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(ad_valorem_rate: nil, specific_rate: nil, surcharge_product_type_id: nil, surcharge_product_type_version: nil)
          super()
          @ad_valorem_rate = ad_valorem_rate
          @specific_rate = specific_rate
          @surcharge_product_type_id = surcharge_product_type_id
          @surcharge_product_type_version = surcharge_product_type_version
        end

        # Sets the property and returns this same instance.
        def with_ad_valorem_rate(value)
          @ad_valorem_rate = value
          self
        end

        # Sets the property and returns this same instance.
        def with_specific_rate(value)
          @specific_rate = value
          self
        end

        # Sets the property and returns this same instance.
        def with_surcharge_product_type_id(value)
          @surcharge_product_type_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_surcharge_product_type_version(value)
          @surcharge_product_type_version = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['adValoremRate'] = @ad_valorem_rate unless @ad_valorem_rate.nil?
          hash['specificRate'] = @specific_rate unless @specific_rate.nil?
          hash['surchargeProductTypeId'] = @surcharge_product_type_id unless @surcharge_product_type_id.nil?
          hash['surchargeProductTypeVersion'] = @surcharge_product_type_version unless @surcharge_product_type_version.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'adValoremRate'
            @ad_valorem_rate = hash['adValoremRate']
          end
          if hash.key? 'specificRate'
            @specific_rate = hash['specificRate']
          end
          if hash.key? 'surchargeProductTypeId'
            @surcharge_product_type_id = hash['surchargeProductTypeId']
          end
          if hash.key? 'surchargeProductTypeVersion'
            @surcharge_product_type_version = hash['surchargeProductTypeVersion']
          end
        end
      end
    end
  end
end
