#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/acceptance'
require 'onlinepayments/sdk/domain/card_essentials'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::Acceptance] acceptance
      # @attr [String] authorisation_code
      # @attr [OnlinePayments::SDK::Domain::CardEssentials] card
      # @attr [Integer] payment_product_id
      class PayoutCardPaymentMethodSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acceptance

        attr_accessor :authorisation_code

        attr_accessor :card

        attr_accessor :payment_product_id

        # @return (Hash)
        def to_h
          hash = super
          hash['acceptance'] = @acceptance.to_h unless @acceptance.nil?
          hash['authorisationCode'] = @authorisation_code unless @authorisation_code.nil?
          hash['card'] = @card.to_h unless @card.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'acceptance'
            raise TypeError, "value '%s' is not a Hash" % [hash['acceptance']] unless hash['acceptance'].is_a? Hash
            @acceptance = OnlinePayments::SDK::Domain::Acceptance.new_from_hash(hash['acceptance'])
          end
          if hash.has_key? 'authorisationCode'
            @authorisation_code = hash['authorisationCode']
          end
          if hash.has_key? 'card'
            raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::CardEssentials.new_from_hash(hash['card'])
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
        end
      end
    end
  end
end
