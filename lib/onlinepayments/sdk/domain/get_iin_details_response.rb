#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/iin_detail'

module OnlinePayments::SDK
  module Domain

    # @attr [String] card_type
    # @attr [Array<OnlinePayments::SDK::Domain::IINDetail>] co_brands
    # @attr [String] country_code
    # @attr [true/false] is_allowed_in_context
    # @attr [Integer] payment_product_id
    class GetIINDetailsResponse < OnlinePayments::SDK::DataObject
      attr_accessor :card_type
      attr_accessor :co_brands
      attr_accessor :country_code
      attr_accessor :is_allowed_in_context
      attr_accessor :payment_product_id

      # @return (Hash)
      def to_h
        hash = super
        hash['cardType'] = @card_type unless @card_type.nil?
        hash['coBrands'] = @co_brands.collect(&:to_h) if @co_brands
        hash['countryCode'] = @country_code unless @country_code.nil?
        hash['isAllowedInContext'] = @is_allowed_in_context unless @is_allowed_in_context.nil?
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash
      end

      def from_hash(hash)
        super
        @card_type = hash['cardType'] if hash.key? 'cardType'
        if hash.key? 'coBrands'
          raise TypeError, "value '%s' is not an Array" % [hash['coBrands']] unless hash['coBrands'].is_a? Array
          @co_brands = []
          hash['coBrands'].each do |e|
            @co_brands << OnlinePayments::SDK::Domain::IINDetail.new_from_hash(e)
          end
        end
        @country_code = hash['countryCode'] if hash.key? 'countryCode'
        @is_allowed_in_context = hash['isAllowedInContext'] if hash.key? 'isAllowedInContext'
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
      end
    end
  end
end
