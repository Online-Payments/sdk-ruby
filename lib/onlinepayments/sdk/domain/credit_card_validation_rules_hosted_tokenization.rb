#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] cvv_mandatory_for_existing_token
      # @attr [true/false] cvv_mandatory_for_new_token
      class CreditCardValidationRulesHostedTokenization < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :cvv_mandatory_for_existing_token

        attr_accessor :cvv_mandatory_for_new_token

        # @return (Hash)
        def to_h
          hash = super
          hash['cvvMandatoryForExistingToken'] = @cvv_mandatory_for_existing_token unless @cvv_mandatory_for_existing_token.nil?
          hash['cvvMandatoryForNewToken'] = @cvv_mandatory_for_new_token unless @cvv_mandatory_for_new_token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cvvMandatoryForExistingToken'
            @cvv_mandatory_for_existing_token = hash['cvvMandatoryForExistingToken']
          end
          if hash.has_key? 'cvvMandatoryForNewToken'
            @cvv_mandatory_for_new_token = hash['cvvMandatoryForNewToken']
          end
        end
      end
    end
  end
end
