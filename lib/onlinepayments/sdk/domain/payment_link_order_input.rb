#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/surcharge_for_payment_link'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount
    # @attr [String] merchant_reference
    # @attr [OnlinePayments::SDK::Domain::SurchargeForPaymentLink] surcharge_specific_input
    class PaymentLinkOrderInput < OnlinePayments::SDK::DataObject
      attr_accessor :amount
      attr_accessor :merchant_reference
      attr_accessor :surcharge_specific_input

      # @return (Hash)
      def to_h
        hash = super
        hash['amount'] = @amount.to_h if @amount
        hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
        hash['surchargeSpecificInput'] = @surcharge_specific_input.to_h if @surcharge_specific_input
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'amount'
          raise TypeError, "value '%s' is not a Hash" % [hash['amount']] unless hash['amount'].is_a? Hash
          @amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amount'])
        end
        @merchant_reference = hash['merchantReference'] if hash.key? 'merchantReference'
        if hash.key? 'surchargeSpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['surchargeSpecificInput']] unless hash['surchargeSpecificInput'].is_a? Hash
          @surcharge_specific_input = OnlinePayments::SDK::Domain::SurchargeForPaymentLink.new_from_hash(hash['surchargeSpecificInput'])
        end
      end
    end
  end
end
