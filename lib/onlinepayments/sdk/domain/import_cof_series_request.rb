#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card_data_without_cvv'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/network_token_data'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CardDataWithoutCvv, nil] card
      # @attr [String, nil] currency_code
      # @attr [OnlinePayments::SDK::Domain::NetworkTokenData, nil] network_token_data
      # @attr [Integer, nil] payment_product_id
      # @attr [String, nil] scheme_reference_data
      # @attr [String, nil] token_id
      # @attr [String, nil] transaction_link_identifier
      class ImportCofSeriesRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card

        attr_accessor :currency_code

        attr_accessor :network_token_data

        attr_accessor :payment_product_id

        attr_accessor :scheme_reference_data

        attr_accessor :token_id

        attr_accessor :transaction_link_identifier

        # Sets the property and returns this same instance.
        def with_card(value)
          @card = value
          self
        end

        # Sets the property and returns this same instance.
        def with_currency_code(value)
          @currency_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_network_token_data(value)
          @network_token_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_product_id(value)
          @payment_product_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_scheme_reference_data(value)
          @scheme_reference_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_token_id(value)
          @token_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_transaction_link_identifier(value)
          @transaction_link_identifier = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['card'] = @card.to_h unless @card.nil?
          hash['currencyCode'] = @currency_code unless @currency_code.nil?
          hash['networkTokenData'] = @network_token_data.to_h unless @network_token_data.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash['schemeReferenceData'] = @scheme_reference_data unless @scheme_reference_data.nil?
          hash['tokenId'] = @token_id unless @token_id.nil?
          hash['transactionLinkIdentifier'] = @transaction_link_identifier unless @transaction_link_identifier.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'card'
            raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
            @card = OnlinePayments::SDK::Domain::CardDataWithoutCvv.new_from_hash(hash['card'])
          end
          if hash.has_key? 'currencyCode'
            @currency_code = hash['currencyCode']
          end
          if hash.has_key? 'networkTokenData'
            raise TypeError, "value '%s' is not a Hash" % [hash['networkTokenData']] unless hash['networkTokenData'].is_a? Hash
            @network_token_data = OnlinePayments::SDK::Domain::NetworkTokenData.new_from_hash(hash['networkTokenData'])
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
          if hash.has_key? 'schemeReferenceData'
            @scheme_reference_data = hash['schemeReferenceData']
          end
          if hash.has_key? 'tokenId'
            @token_id = hash['tokenId']
          end
          if hash.has_key? 'transactionLinkIdentifier'
            @transaction_link_identifier = hash['transactionLinkIdentifier']
          end
        end
      end
    end
  end
end
