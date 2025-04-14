#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/complete_payment_card_payment_method_specific_input'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/order'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CompletePaymentCardPaymentMethodSpecificInput] card_payment_method_specific_input
      # @attr [OnlinePayments::SDK::Domain::Order] order
      class CompletePaymentRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_payment_method_specific_input

        attr_accessor :order

        # @return (Hash)
        def to_h
          hash = super
          hash['cardPaymentMethodSpecificInput'] = @card_payment_method_specific_input.to_h unless @card_payment_method_specific_input.nil?
          hash['order'] = @order.to_h unless @order.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cardPaymentMethodSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['cardPaymentMethodSpecificInput']] unless hash['cardPaymentMethodSpecificInput'].is_a? Hash
            @card_payment_method_specific_input = OnlinePayments::SDK::Domain::CompletePaymentCardPaymentMethodSpecificInput.new_from_hash(hash['cardPaymentMethodSpecificInput'])
          end
          if hash.has_key? 'order'
            raise TypeError, "value '%s' is not a Hash" % [hash['order']] unless hash['order'].is_a? Hash
            @order = OnlinePayments::SDK::Domain::Order.new_from_hash(hash['order'])
          end
        end
      end
    end
  end
end
