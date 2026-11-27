# frozen_string_literal: true

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

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(purchase_type: nil, transaction_type: nil)
          super()
          @purchase_type = purchase_type
          @transaction_type = transaction_type
        end

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
          if hash.key? 'purchaseType'
            @purchase_type = hash['purchaseType']
          end
          if hash.key? 'transactionType'
            @transaction_type = hash['transactionType']
          end
        end
      end
    end
  end
end
