# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::Card, nil] card
      # @attr [String, nil] cobrand_selection_indicator
      class TokenData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card

        attr_accessor :cobrand_selection_indicator

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(card: nil, cobrand_selection_indicator: nil)
          super()
          @card = card
          @cobrand_selection_indicator = cobrand_selection_indicator
        end

        # Sets the property and returns this same instance.
        def with_card(value)
          @card = value
          self
        end

        # Sets the property and returns this same instance.
        def with_cobrand_selection_indicator(value)
          @cobrand_selection_indicator = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['card'] = @card.to_h unless @card.nil?
          hash['cobrandSelectionIndicator'] = @cobrand_selection_indicator unless @cobrand_selection_indicator.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'card'
            raise TypeError, "value '#{hash['card']}' is not a Hash" unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::Card.new_from_hash(hash['card'])
          end
          if hash.key? 'cobrandSelectionIndicator'
            @cobrand_selection_indicator = hash['cobrandSelectionIndicator']
          end
        end
      end
    end
  end
end
