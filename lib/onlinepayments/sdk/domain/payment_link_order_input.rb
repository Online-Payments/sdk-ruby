#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/surcharge_for_payment_link'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount
      # @attr [String] merchant_reference
      # @attr [OnlinePayments::SDK::Domain::SurchargeForPaymentLink] surcharge_specific_input
      class PaymentLinkOrderInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount

        attr_accessor :merchant_reference

        attr_accessor :surcharge_specific_input

        # @return (Hash)
        def to_h
          hash = super
          hash['amount'] = @amount.to_h unless @amount.nil?
          hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
          hash['surchargeSpecificInput'] = @surcharge_specific_input.to_h unless @surcharge_specific_input.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amount'
            raise TypeError, "value '%s' is not a Hash" % [hash['amount']] unless hash['amount'].is_a? Hash
            @amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amount'])
          end
          if hash.has_key? 'merchantReference'
            @merchant_reference = hash['merchantReference']
          end
          if hash.has_key? 'surchargeSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['surchargeSpecificInput']] unless hash['surchargeSpecificInput'].is_a? Hash
            @surcharge_specific_input = OnlinePayments::SDK::Domain::SurchargeForPaymentLink.new_from_hash(hash['surchargeSpecificInput'])
          end
        end
      end
    end
  end
end
