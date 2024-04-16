#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [true/false] group_cards
    # @attr [Array<Integer>] payment_product_preferred_order
    class CardPaymentMethodSpecificInputForHostedCheckout < OnlinePayments::SDK::DataObject
      attr_accessor :group_cards
      attr_accessor :payment_product_preferred_order

      # @return (Hash)
      def to_h
        hash = super
        hash['groupCards'] = @group_cards unless @group_cards.nil?
        hash['paymentProductPreferredOrder'] = @payment_product_preferred_order unless @payment_product_preferred_order.nil?
        hash
      end

      def from_hash(hash)
        super
        @group_cards = hash['groupCards'] if hash.key? 'groupCards'
        if hash.key? 'paymentProductPreferredOrder'
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
