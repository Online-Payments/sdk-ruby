# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card_without_cvv'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CardWithoutCvv, nil] card
      class CompletePaymentCardPaymentMethodSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(card: nil)
          super()
          @card = card
        end

        # Sets the property and returns this same instance.
        def with_card(value)
          @card = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['card'] = @card.to_h unless @card.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'card'
            raise TypeError, "value '#{hash['card']}' is not a Hash" unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::CardWithoutCvv.new_from_hash(hash['card'])
          end
        end
      end
    end
  end
end
