#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] avs_result
      # @attr [String] cvv_result
      # @attr [String] fraud_service_result
      class CardFraudResults < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :avs_result

        attr_accessor :cvv_result

        attr_accessor :fraud_service_result

        # @return (Hash)
        def to_h
          hash = super
          hash['avsResult'] = @avs_result unless @avs_result.nil?
          hash['cvvResult'] = @cvv_result unless @cvv_result.nil?
          hash['fraudServiceResult'] = @fraud_service_result unless @fraud_service_result.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'avsResult'
            @avs_result = hash['avsResult']
          end
          if hash.has_key? 'cvvResult'
            @cvv_result = hash['cvvResult']
          end
          if hash.has_key? 'fraudServiceResult'
            @fraud_service_result = hash['fraudServiceResult']
          end
        end
      end
    end
  end
end
