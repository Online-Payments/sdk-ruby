#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card_payment_method_specific_output_summary_card'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CardPaymentMethodSpecificOutputSummaryCard] card
      # @attr [String] token
      class CardPaymentMethodSpecificOutputSummary < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card

        attr_accessor :token

        # @return (Hash)
        def to_h
          hash = super
          hash['card'] = @card.to_h unless @card.nil?
          hash['token'] = @token unless @token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'card'
            raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificOutputSummaryCard.new_from_hash(hash['card'])
          end
          if hash.has_key? 'token'
            @token = hash['token']
          end
        end
      end
    end
  end
end
