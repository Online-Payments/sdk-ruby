#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] acquirer_bin
      # @attr [String, nil] acquirer_merchant_id
      # @attr [String, nil] merchant_name
      class VisaAuthenticationOptions < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acquirer_bin

        attr_accessor :acquirer_merchant_id

        attr_accessor :merchant_name

        # @return (Hash)
        def to_h
          hash = super
          hash['acquirerBIN'] = @acquirer_bin unless @acquirer_bin.nil?
          hash['acquirerMerchantId'] = @acquirer_merchant_id unless @acquirer_merchant_id.nil?
          hash['merchantName'] = @merchant_name unless @merchant_name.nil?
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
          if hash.has_key? 'merchantName'
            @merchant_name = hash['merchantName']
          end
        end
      end
    end
  end
end
