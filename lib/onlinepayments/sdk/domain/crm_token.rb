#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] unique_account_identifier
      # @attr [String, nil] unique_card_identifier
      class CrmToken < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :unique_account_identifier

        attr_accessor :unique_card_identifier

        # Sets the property and returns this same instance.
        def with_unique_account_identifier(value)
          @unique_account_identifier = value
          self
        end

        # Sets the property and returns this same instance.
        def with_unique_card_identifier(value)
          @unique_card_identifier = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['uniqueAccountIdentifier'] = @unique_account_identifier unless @unique_account_identifier.nil?
          hash['uniqueCardIdentifier'] = @unique_card_identifier unless @unique_card_identifier.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'uniqueAccountIdentifier'
            @unique_account_identifier = hash['uniqueAccountIdentifier']
          end
          if hash.has_key? 'uniqueCardIdentifier'
            @unique_card_identifier = hash['uniqueCardIdentifier']
          end
        end
      end
    end
  end
end
