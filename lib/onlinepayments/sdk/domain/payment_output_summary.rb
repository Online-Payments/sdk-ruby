#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/card_payment_method_specific_output_summary'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_references'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
      # @attr [OnlinePayments::SDK::Domain::CardPaymentMethodSpecificOutputSummary] card_payment_method_specific_output
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences] references
      # @attr [DateTime] transaction_date
      class PaymentOutputSummary < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :card_payment_method_specific_output

        attr_accessor :references

        attr_accessor :transaction_date

        # @return (Hash)
        def to_h
          hash = super
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['cardPaymentMethodSpecificOutput'] = @card_payment_method_specific_output.to_h unless @card_payment_method_specific_output.nil?
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
          if hash.has_key? 'cardPaymentMethodSpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['cardPaymentMethodSpecificOutput']] unless hash['cardPaymentMethodSpecificOutput'].is_a? Hash
            @card_payment_method_specific_output = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificOutputSummary.new_from_hash(hash['cardPaymentMethodSpecificOutput'])
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
