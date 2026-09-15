#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/address'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::Address, nil] address
      # @attr [String, nil] company_identification_number
      # @attr [String, nil] company_name
      # @attr [String, nil] merchant_category_code
      # @attr [String, nil] merchant_id
      # @attr [String, nil] website
      class SubMerchant < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :address

        attr_accessor :company_identification_number

        attr_accessor :company_name

        attr_accessor :merchant_category_code

        attr_accessor :merchant_id

        attr_accessor :website

        # @return (Hash)
        def to_h
          hash = super
          hash['address'] = @address.to_h unless @address.nil?
          hash['companyIdentificationNumber'] = @company_identification_number unless @company_identification_number.nil?
          hash['companyName'] = @company_name unless @company_name.nil?
          hash['merchantCategoryCode'] = @merchant_category_code unless @merchant_category_code.nil?
          hash['merchantId'] = @merchant_id unless @merchant_id.nil?
          hash['website'] = @website unless @website.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'address'
            raise TypeError, "value '%s' is not a Hash" % [hash['address']] unless hash['address'].is_a? Hash
            @address = OnlinePayments::SDK::Domain::Address.new_from_hash(hash['address'])
          end
          if hash.has_key? 'companyIdentificationNumber'
            @company_identification_number = hash['companyIdentificationNumber']
          end
          if hash.has_key? 'companyName'
            @company_name = hash['companyName']
          end
          if hash.has_key? 'merchantCategoryCode'
            @merchant_category_code = hash['merchantCategoryCode']
          end
          if hash.has_key? 'merchantId'
            @merchant_id = hash['merchantId']
          end
          if hash.has_key? 'website'
            @website = hash['website']
          end
        end
      end
    end
  end
end
