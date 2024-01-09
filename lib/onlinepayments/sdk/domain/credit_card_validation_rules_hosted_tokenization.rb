#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [true/false] cvv_mandatory_for_existing_token
    # @attr [true/false] cvv_mandatory_for_new_token
    class CreditCardValidationRulesHostedTokenization < OnlinePayments::SDK::DataObject
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
        @cvv_mandatory_for_existing_token = hash['cvvMandatoryForExistingToken'] if hash.key? 'cvvMandatoryForExistingToken'
        @cvv_mandatory_for_new_token = hash['cvvMandatoryForNewToken'] if hash.key? 'cvvMandatoryForNewToken'
      end
    end
  end
end
