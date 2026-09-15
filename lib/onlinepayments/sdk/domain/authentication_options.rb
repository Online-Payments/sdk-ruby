#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] acquirer_bin
      # @attr [String, nil] acquirer_merchant_id
      # @attr [String, nil] merchant_category_code
      # @attr [String, nil] merchant_country_code
      class AuthenticationOptions < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acquirer_bin

        attr_accessor :acquirer_merchant_id

        attr_accessor :merchant_category_code

        attr_accessor :merchant_country_code

        # @return (Hash)
        def to_h
          hash = super
          hash['acquirerBIN'] = @acquirer_bin unless @acquirer_bin.nil?
          hash['acquirerMerchantId'] = @acquirer_merchant_id unless @acquirer_merchant_id.nil?
          hash['merchantCategoryCode'] = @merchant_category_code unless @merchant_category_code.nil?
          hash['merchantCountryCode'] = @merchant_country_code unless @merchant_country_code.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'acquirerBIN'
            @acquirer_bin = hash['acquirerBIN']
          end
          if hash.has_key? 'acquirerMerchantId'
            @acquirer_merchant_id = hash['acquirerMerchantId']
          end
          if hash.has_key? 'merchantCategoryCode'
            @merchant_category_code = hash['merchantCategoryCode']
          end
          if hash.has_key? 'merchantCountryCode'
            @merchant_country_code = hash['merchantCountryCode']
          end
        end
      end
    end
  end
end
