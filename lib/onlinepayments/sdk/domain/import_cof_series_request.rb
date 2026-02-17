#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card_data_without_cvv'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CardDataWithoutCvv] card
      # @attr [String] currency_code
      # @attr [Integer] payment_product_id
      # @attr [String] scheme_reference_data
      # @attr [String] token_id
      class ImportCofSeriesRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card

        attr_accessor :currency_code

        attr_accessor :payment_product_id

        attr_accessor :scheme_reference_data

        attr_accessor :token_id

        # @return (Hash)
        def to_h
          hash = super
          hash['card'] = @card.to_h unless @card.nil?
          hash['currencyCode'] = @currency_code unless @currency_code.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash['schemeReferenceData'] = @scheme_reference_data unless @scheme_reference_data.nil?
          hash['tokenId'] = @token_id unless @token_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'card'
            raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::CardDataWithoutCvv.new_from_hash(hash['card'])
          end
          if hash.has_key? 'currencyCode'
            @currency_code = hash['currencyCode']
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
          if hash.has_key? 'schemeReferenceData'
            @scheme_reference_data = hash['schemeReferenceData']
          end
          if hash.has_key? 'tokenId'
            @token_id = hash['tokenId']
          end
        end
      end
    end
  end
end
