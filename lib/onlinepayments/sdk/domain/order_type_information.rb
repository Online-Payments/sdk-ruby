#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] purchase_type
      # @attr [String, nil] transaction_type
      class OrderTypeInformation < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :purchase_type

        attr_accessor :transaction_type

        # Sets the property and returns this same instance.
        def with_purchase_type(value)
          @purchase_type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_transaction_type(value)
          @transaction_type = value
          self
        end

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
