# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card_payment_method_specific_output_summary_card'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CardPaymentMethodSpecificOutputSummaryCard, nil] card
      # @attr [String, nil] token
      class CardPaymentMethodSpecificOutputSummary < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card

        attr_accessor :token

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(card: nil, token: nil)
          super()
          @card = card
          @token = token
        end

        # Sets the property and returns this same instance.
        def with_card(value)
          @card = value
          self
        end

        # Sets the property and returns this same instance.
        def with_token(value)
          @token = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['card'] = @card.to_h unless @card.nil?
          hash['token'] = @token unless @token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'card'
            raise TypeError, "value '#{hash['card']}' is not a Hash" unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificOutputSummaryCard.new_from_hash(hash['card'])
          end
          if hash.key? 'token'
            @token = hash['token']
          end
        end
      end
    end
  end
end
