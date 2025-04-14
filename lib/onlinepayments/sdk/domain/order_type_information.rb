#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] purchase_type
      # @attr [String] transaction_type
      class OrderTypeInformation < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :purchase_type

        attr_accessor :transaction_type

        # @return (Hash)
        def to_h
          hash = super
          hash['purchaseType'] = @purchase_type unless @purchase_type.nil?
          hash['transactionType'] = @transaction_type unless @transaction_type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'purchaseType'
            @purchase_type = hash['purchaseType']
          end
          if hash.has_key? 'transactionType'
            @transaction_type = hash['transactionType']
          end
        end
      end
    end
  end
end
