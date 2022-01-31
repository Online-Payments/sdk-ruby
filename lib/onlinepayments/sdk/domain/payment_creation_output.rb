#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] external_reference
    # @attr [true/false] is_new_token
    # @attr [String] token
    # @attr [true/false] tokenization_succeeded
    class PaymentCreationOutput < OnlinePayments::SDK::DataObject
      attr_accessor :external_reference
      attr_accessor :is_new_token
      attr_accessor :token
      attr_accessor :tokenization_succeeded

      # @return (Hash)
      def to_h
        hash = super
        hash['externalReference'] = @external_reference unless @external_reference.nil?
        hash['isNewToken'] = @is_new_token unless @is_new_token.nil?
        hash['token'] = @token unless @token.nil?
        hash['tokenizationSucceeded'] = @tokenization_succeeded unless @tokenization_succeeded.nil?
        hash
      end

      def from_hash(hash)
        super
        @external_reference = hash['externalReference'] if hash.key? 'externalReference'
        @is_new_token = hash['isNewToken'] if hash.key? 'isNewToken'
        @token = hash['token'] if hash.key? 'token'
        @tokenization_succeeded = hash['tokenizationSucceeded'] if hash.key? 'tokenizationSucceeded'
      end
    end
  end
end
