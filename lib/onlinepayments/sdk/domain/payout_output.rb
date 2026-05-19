#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_references'
require 'onlinepayments/sdk/domain/payout_card_payment_method_specific_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
      # @attr [OnlinePayments::SDK::Domain::PayoutCardPaymentMethodSpecificOutput] payout_card_payment_method_specific_output
      # @attr [String] payout_reason
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences] references
      # @attr [DateTime] transaction_date
      class PayoutOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :payout_card_payment_method_specific_output

        attr_accessor :payout_reason

        attr_accessor :references

        attr_accessor :transaction_date

        # @return (Hash)
        def to_h
          hash = super
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['payoutCardPaymentMethodSpecificOutput'] = @payout_card_payment_method_specific_output.to_h unless @payout_card_payment_method_specific_output.nil?
          hash['payoutReason'] = @payout_reason unless @payout_reason.nil?
          hash['references'] = @references.to_h unless @references.nil?
          hash['transactionDate'] = @transaction_date.iso8601(3) unless @transaction_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amountOfMoney'
            raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.has_key? 'payoutCardPaymentMethodSpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['payoutCardPaymentMethodSpecificOutput']] unless hash['payoutCardPaymentMethodSpecificOutput'].is_a? Hash
            @payout_card_payment_method_specific_output = OnlinePayments::SDK::Domain::PayoutCardPaymentMethodSpecificOutput.new_from_hash(hash['payoutCardPaymentMethodSpecificOutput'])
          end
          if hash.has_key? 'payoutReason'
            @payout_reason = hash['payoutReason']
          end
          if hash.has_key? 'references'
            raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
          end
          if hash.has_key? 'transactionDate'
            @transaction_date = DateTime.parse(hash['transactionDate'])
          end
        end
      end
    end
  end
end
