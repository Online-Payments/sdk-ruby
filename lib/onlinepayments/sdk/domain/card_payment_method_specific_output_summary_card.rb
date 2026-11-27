# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] card_number
      class CardPaymentMethodSpecificOutputSummaryCard < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_number

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(card_number: nil)
          super()
          @card_number = card_number
        end

        # Sets the property and returns this same instance.
        def with_card_number(value)
          @card_number = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['cardNumber'] = @card_number unless @card_number.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'cardNumber'
            @card_number = hash['cardNumber']
          end
        end
      end
    end
  end
end
