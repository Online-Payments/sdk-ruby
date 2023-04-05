#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/order'
require 'onlinepayments/sdk/domain/subsequent_card_payment_method_specific_input'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::Order] order
    # @attr [OnlinePayments::SDK::Domain::SubsequentCardPaymentMethodSpecificInput] subsequentcard_payment_method_specific_input
    class SubsequentPaymentRequest < OnlinePayments::SDK::DataObject
      attr_accessor :order
      attr_accessor :subsequentcard_payment_method_specific_input

      # @return (Hash)
      def to_h
        hash = super
        hash['order'] = @order.to_h if @order
        hash['subsequentcardPaymentMethodSpecificInput'] = @subsequentcard_payment_method_specific_input.to_h if @subsequentcard_payment_method_specific_input
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'order'
          raise TypeError, "value '%s' is not a Hash" % [hash['order']] unless hash['order'].is_a? Hash
          @order = OnlinePayments::SDK::Domain::Order.new_from_hash(hash['order'])
        end
        if hash.key? 'subsequentcardPaymentMethodSpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['subsequentcardPaymentMethodSpecificInput']] unless hash['subsequentcardPaymentMethodSpecificInput'].is_a? Hash
          @subsequentcard_payment_method_specific_input = OnlinePayments::SDK::Domain::SubsequentCardPaymentMethodSpecificInput.new_from_hash(hash['subsequentcardPaymentMethodSpecificInput'])
        end
      end
    end
  end
end
