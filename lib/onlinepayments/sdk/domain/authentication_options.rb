# frozen_string_literal: true

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

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(acquirer_bin: nil, acquirer_merchant_id: nil, merchant_category_code: nil, merchant_country_code: nil)
          super()
          @acquirer_bin = acquirer_bin
          @acquirer_merchant_id = acquirer_merchant_id
          @merchant_category_code = merchant_category_code
          @merchant_country_code = merchant_country_code
        end

        # Sets the property and returns this same instance.
        def with_acquirer_bin(value)
          @acquirer_bin = value
          self
        end

        # Sets the property and returns this same instance.
        def with_acquirer_merchant_id(value)
          @acquirer_merchant_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_merchant_category_code(value)
          @merchant_category_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_merchant_country_code(value)
          @merchant_country_code = value
          self
        end

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
          if hash.key? 'acquirerBIN'
            @acquirer_bin = hash['acquirerBIN']
          end
          if hash.key? 'acquirerMerchantId'
            @acquirer_merchant_id = hash['acquirerMerchantId']
          end
          if hash.key? 'merchantCategoryCode'
            @merchant_category_code = hash['merchantCategoryCode']
          end
          if hash.key? 'merchantCountryCode'
            @merchant_country_code = hash['merchantCountryCode']
          end
        end
      end
    end
  end
end
