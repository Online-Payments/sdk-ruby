#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] mode
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] surcharge_amount
      class SurchargeSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :mode

        attr_accessor :surcharge_amount

        # @return (Hash)
        def to_h
          hash = super
          hash['mode'] = @mode unless @mode.nil?
          hash['surchargeAmount'] = @surcharge_amount.to_h unless @surcharge_amount.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'mode'
            @mode = hash['mode']
          end
          if hash.has_key? 'surchargeAmount'
            raise TypeError, "value '%s' is not a Hash" % [hash['surchargeAmount']] unless hash['surchargeAmount'].is_a? Hash
            @surcharge_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['surchargeAmount'])
          end
        end
      end
    end
  end
end
