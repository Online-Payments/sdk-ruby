#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card_without_cvv'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CardWithoutCvv] card
      class CompletePaymentCardPaymentMethodSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card

        # @return (Hash)
        def to_h
          hash = super
          hash['card'] = @card.to_h unless @card.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'card'
            raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::CardWithoutCvv.new_from_hash(hash['card'])
          end
        end
      end
    end
  end
end
