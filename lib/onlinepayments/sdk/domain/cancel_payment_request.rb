#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
      # @attr [true/false] is_final
      class CancelPaymentRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :is_final

        # @return (Hash)
        def to_h
          hash = super
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['isFinal'] = @is_final unless @is_final.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amountOfMoney'
            raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.has_key? 'isFinal'
            @is_final = hash['isFinal']
          end
        end
      end
    end
  end
end
