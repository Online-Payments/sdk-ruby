#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] click_to_pay
      # @attr [true/false] group_cards
      # @attr [Array<Integer>] payment_product_preferred_order
      class CardPaymentMethodSpecificInputForHostedCheckout < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :click_to_pay

        attr_accessor :group_cards

        attr_accessor :payment_product_preferred_order

        # @return (Hash)
        def to_h
          hash = super
          hash['clickToPay'] = @click_to_pay unless @click_to_pay.nil?
          hash['groupCards'] = @group_cards unless @group_cards.nil?
          hash['paymentProductPreferredOrder'] = @payment_product_preferred_order unless @payment_product_preferred_order.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'clickToPay'
            @click_to_pay = hash['clickToPay']
          end
          if hash.has_key? 'groupCards'
            @group_cards = hash['groupCards']
          end
          if hash.has_key? 'paymentProductPreferredOrder'
            raise TypeError, "value '%s' is not an Array" % [hash['paymentProductPreferredOrder']] unless hash['paymentProductPreferredOrder'].is_a? Array
            @payment_product_preferred_order = []
            hash['paymentProductPreferredOrder'].each do |e|
              @payment_product_preferred_order << e
            end
          end
        end
      end
    end
  end
end
