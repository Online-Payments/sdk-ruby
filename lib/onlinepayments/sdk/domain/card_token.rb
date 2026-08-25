#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] cardholder_name
      # @attr [String] expiry_date
      # @attr [String] logo_url
      # @attr [String] masked_pan
      # @attr [Integer] payment_product_id
      # @attr [String] product_name
      # @attr [String] token
      class CardToken < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :cardholder_name

        attr_accessor :expiry_date

        attr_accessor :logo_url

        attr_accessor :masked_pan

        attr_accessor :payment_product_id

        attr_accessor :product_name

        attr_accessor :token

        # @return (Hash)
        def to_h
          hash = super
          hash['cardholderName'] = @cardholder_name unless @cardholder_name.nil?
          hash['expiryDate'] = @expiry_date unless @expiry_date.nil?
          hash['logoUrl'] = @logo_url unless @logo_url.nil?
          hash['maskedPan'] = @masked_pan unless @masked_pan.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash['productName'] = @product_name unless @product_name.nil?
          hash['token'] = @token unless @token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cardholderName'
            @cardholder_name = hash['cardholderName']
          end
          if hash.has_key? 'expiryDate'
            @expiry_date = hash['expiryDate']
          end
          if hash.has_key? 'logoUrl'
            @logo_url = hash['logoUrl']
          end
          if hash.has_key? 'maskedPan'
            @masked_pan = hash['maskedPan']
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
          if hash.has_key? 'productName'
            @product_name = hash['productName']
          end
          if hash.has_key? 'token'
            @token = hash['token']
          end
        end
      end
    end
  end
end
