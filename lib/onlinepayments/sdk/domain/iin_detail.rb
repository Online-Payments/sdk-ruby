#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] card_type
      # @attr [true/false] is_allowed_in_context
      # @attr [Integer] payment_product_id
      class IINDetail < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_type

        attr_accessor :is_allowed_in_context

        attr_accessor :payment_product_id

        # @return (Hash)
        def to_h
          hash = super
          hash['cardType'] = @card_type unless @card_type.nil?
          hash['isAllowedInContext'] = @is_allowed_in_context unless @is_allowed_in_context.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cardType'
            @card_type = hash['cardType']
          end
          if hash.has_key? 'isAllowedInContext'
            @is_allowed_in_context = hash['isAllowedInContext']
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
        end
      end
    end
  end
end
