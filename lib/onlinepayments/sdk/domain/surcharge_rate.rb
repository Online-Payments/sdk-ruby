#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [float] ad_valorem_rate
      # @attr [Integer] specific_rate
      # @attr [String] surcharge_product_type_id
      # @attr [String] surcharge_product_type_version
      class SurchargeRate < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :ad_valorem_rate

        attr_accessor :specific_rate

        attr_accessor :surcharge_product_type_id

        attr_accessor :surcharge_product_type_version

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
          if hash.has_key? 'adValoremRate'
            @ad_valorem_rate = hash['adValoremRate']
          end
          if hash.has_key? 'specificRate'
            @specific_rate = hash['specificRate']
          end
          if hash.has_key? 'surchargeProductTypeId'
            @surcharge_product_type_id = hash['surchargeProductTypeId']
          end
          if hash.has_key? 'surchargeProductTypeVersion'
            @surcharge_product_type_version = hash['surchargeProductTypeVersion']
          end
        end
      end
    end
  end
end
