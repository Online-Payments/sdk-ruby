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
    # @attr [OnlinePayments::SDK::Domain::SurchargeForPaymentLink] surcharge_specific_output
    class PaymentLinkOrderOutput < OnlinePayments::SDK::DataObject
      attr_accessor :amount
      attr_accessor :merchant_reference
      attr_accessor :surcharge_specific_output

      # @return (Hash)
      def to_h
        hash = super
        hash['amount'] = @amount.to_h if @amount
        hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
        hash['surchargeSpecificOutput'] = @surcharge_specific_output.to_h if @surcharge_specific_output
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'amount'
          raise TypeError, "value '%s' is not a Hash" % [hash['amount']] unless hash['amount'].is_a? Hash
          @amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amount'])
        end
        @merchant_reference = hash['merchantReference'] if hash.key? 'merchantReference'
        if hash.key? 'surchargeSpecificOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['surchargeSpecificOutput']] unless hash['surchargeSpecificOutput'].is_a? Hash
          @surcharge_specific_output = OnlinePayments::SDK::Domain::SurchargeForPaymentLink.new_from_hash(hash['surchargeSpecificOutput'])
        end
      end
    end
  end
end
