#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] card_number
      # @attr [Integer] payment_product_id
      class SurchargeCalculationCard < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_number

        attr_accessor :payment_product_id

        # @return (Hash)
        def to_h
          hash = super
          hash['cardNumber'] = @card_number unless @card_number.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cardNumber'
            @card_number = hash['cardNumber']
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
        end
      end
    end
  end
end
