#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card_info'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CardInfo] card
      # @attr [String] encrypted_customer_input
      # @attr [String] hosted_tokenization_id
      # @attr [String] token
      class DccCardSource < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card

        attr_accessor :encrypted_customer_input

        attr_accessor :hosted_tokenization_id

        attr_accessor :token

        # @return (Hash)
        def to_h
          hash = super
          hash['card'] = @card.to_h unless @card.nil?
          hash['encryptedCustomerInput'] = @encrypted_customer_input unless @encrypted_customer_input.nil?
          hash['hostedTokenizationId'] = @hosted_tokenization_id unless @hosted_tokenization_id.nil?
          hash['token'] = @token unless @token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'card'
            raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::CardInfo.new_from_hash(hash['card'])
          end
          if hash.has_key? 'encryptedCustomerInput'
            @encrypted_customer_input = hash['encryptedCustomerInput']
          end
          if hash.has_key? 'hostedTokenizationId'
            @hosted_tokenization_id = hash['hostedTokenizationId']
          end
          if hash.has_key? 'token'
            @token = hash['token']
          end
        end
      end
    end
  end
end
