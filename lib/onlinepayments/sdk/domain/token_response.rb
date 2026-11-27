# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/crm_token'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/external_token_linked'
require 'onlinepayments/sdk/domain/network_token_linked'
require 'onlinepayments/sdk/domain/token_card'
require 'onlinepayments/sdk/domain/token_e_wallet'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::TokenCard, nil] card
      # @attr [OnlinePayments::SDK::Domain::CrmToken, nil] crm_token
      # @attr [OnlinePayments::SDK::Domain::TokenEWallet, nil] e_wallet
      # @attr [OnlinePayments::SDK::Domain::ExternalTokenLinked, nil] external_token_linked
      # @attr [String, nil] id
      # @attr [true/false, nil] is_temporary
      # @attr [OnlinePayments::SDK::Domain::NetworkTokenLinked, nil] network_token_linked
      # @attr [Integer, nil] payment_product_id
      class TokenResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card

        attr_accessor :crm_token

        attr_accessor :e_wallet

        attr_accessor :external_token_linked

        attr_accessor :id

        attr_accessor :is_temporary

        attr_accessor :network_token_linked

        attr_accessor :payment_product_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(card: nil,
                       crm_token: nil,
                       e_wallet: nil,
                       external_token_linked: nil,
                       id: nil,
                       is_temporary: nil,
                       network_token_linked: nil,
                       payment_product_id: nil)
          super()
          @card = card
          @crm_token = crm_token
          @e_wallet = e_wallet
          @external_token_linked = external_token_linked
          @id = id
          @is_temporary = is_temporary
          @network_token_linked = network_token_linked
          @payment_product_id = payment_product_id
        end

        # Sets the property and returns this same instance.
        def with_card(value)
          @card = value
          self
        end

        # Sets the property and returns this same instance.
        def with_crm_token(value)
          @crm_token = value
          self
        end

        # Sets the property and returns this same instance.
        def with_e_wallet(value)
          @e_wallet = value
          self
        end

        # Sets the property and returns this same instance.
        def with_external_token_linked(value)
          @external_token_linked = value
          self
        end

        # Sets the property and returns this same instance.
        def with_id(value)
          @id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_temporary(value)
          @is_temporary = value
          self
        end

        # Sets the property and returns this same instance.
        def with_network_token_linked(value)
          @network_token_linked = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_product_id(value)
          @payment_product_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['card'] = @card.to_h unless @card.nil?
          hash['crmToken'] = @crm_token.to_h unless @crm_token.nil?
          hash['eWallet'] = @e_wallet.to_h unless @e_wallet.nil?
          hash['externalTokenLinked'] = @external_token_linked.to_h unless @external_token_linked.nil?
          hash['id'] = @id unless @id.nil?
          hash['isTemporary'] = @is_temporary unless @is_temporary.nil?
          hash['networkTokenLinked'] = @network_token_linked.to_h unless @network_token_linked.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'card'
            raise TypeError, "value '#{hash['card']}' is not a Hash" unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::TokenCard.new_from_hash(hash['card'])
          end
          if hash.key? 'crmToken'
            raise TypeError, "value '#{hash['crmToken']}' is not a Hash" unless hash['crmToken'].is_a? Hash
            @crm_token = OnlinePayments::SDK::Domain::CrmToken.new_from_hash(hash['crmToken'])
          end
          if hash.key? 'eWallet'
            raise TypeError, "value '#{hash['eWallet']}' is not a Hash" unless hash['eWallet'].is_a? Hash
            @e_wallet = OnlinePayments::SDK::Domain::TokenEWallet.new_from_hash(hash['eWallet'])
          end
          if hash.key? 'externalTokenLinked'
            raise TypeError, "value '#{hash['externalTokenLinked']}' is not a Hash" unless hash['externalTokenLinked'].is_a? Hash
            @external_token_linked = OnlinePayments::SDK::Domain::ExternalTokenLinked.new_from_hash(hash['externalTokenLinked'])
          end
          if hash.key? 'id'
            @id = hash['id']
          end
          if hash.key? 'isTemporary'
            @is_temporary = hash['isTemporary']
          end
          if hash.key? 'networkTokenLinked'
            raise TypeError, "value '#{hash['networkTokenLinked']}' is not a Hash" unless hash['networkTokenLinked'].is_a? Hash
            @network_token_linked = OnlinePayments::SDK::Domain::NetworkTokenLinked.new_from_hash(hash['networkTokenLinked'])
          end
          if hash.key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
        end
      end
    end
  end
end
