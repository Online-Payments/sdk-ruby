#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::Card] card
      # @attr [String] cobrand_selection_indicator
      class TokenData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card

        attr_accessor :cobrand_selection_indicator

        # @return (Hash)
        def to_h
          hash = super
          hash['card'] = @card.to_h unless @card.nil?
          hash['cobrandSelectionIndicator'] = @cobrand_selection_indicator unless @cobrand_selection_indicator.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'card'
            raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::Card.new_from_hash(hash['card'])
          end
          if hash.has_key? 'cobrandSelectionIndicator'
            @cobrand_selection_indicator = hash['cobrandSelectionIndicator']
          end
        end
      end
    end
  end
end
