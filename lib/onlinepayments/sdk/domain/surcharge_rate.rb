#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [Float] ad_valorem_rate
    # @attr [Integer] specific_rate
    # @attr [String] surcharge_product_type_id
    # @attr [String] surcharge_product_type_version
    class SurchargeRate < OnlinePayments::SDK::DataObject
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
        @ad_valorem_rate = hash['adValoremRate'] if hash.key? 'adValoremRate'
        @specific_rate = hash['specificRate'] if hash.key? 'specificRate'
        @surcharge_product_type_id = hash['surchargeProductTypeId'] if hash.key? 'surchargeProductTypeId'
        @surcharge_product_type_version = hash['surchargeProductTypeVersion'] if hash.key? 'surchargeProductTypeVersion'
      end
    end
  end
end
