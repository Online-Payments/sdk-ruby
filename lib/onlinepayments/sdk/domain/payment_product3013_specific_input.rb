# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] market_number
      # @attr [String, nil] purchasing_buyer_reference1
      # @attr [String, nil] purchasing_buyer_reference2
      class PaymentProduct3013SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :market_number

        attr_accessor :purchasing_buyer_reference1

        attr_accessor :purchasing_buyer_reference2

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(market_number: nil, purchasing_buyer_reference1: nil, purchasing_buyer_reference2: nil)
          super()
          @market_number = market_number
          @purchasing_buyer_reference1 = purchasing_buyer_reference1
          @purchasing_buyer_reference2 = purchasing_buyer_reference2
        end

        # Sets the property and returns this same instance.
        def with_market_number(value)
          @market_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_purchasing_buyer_reference1(value)
          @purchasing_buyer_reference1 = value
          self
        end

        # Sets the property and returns this same instance.
        def with_purchasing_buyer_reference2(value)
          @purchasing_buyer_reference2 = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['marketNumber'] = @market_number unless @market_number.nil?
          hash['purchasingBuyerReference1'] = @purchasing_buyer_reference1 unless @purchasing_buyer_reference1.nil?
          hash['purchasingBuyerReference2'] = @purchasing_buyer_reference2 unless @purchasing_buyer_reference2.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'marketNumber'
            @market_number = hash['marketNumber']
          end
          if hash.key? 'purchasingBuyerReference1'
            @purchasing_buyer_reference1 = hash['purchasingBuyerReference1']
          end
          if hash.key? 'purchasingBuyerReference2'
            @purchasing_buyer_reference2 = hash['purchasingBuyerReference2']
          end
        end
      end
    end
  end
end
