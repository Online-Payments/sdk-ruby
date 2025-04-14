#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] external_reference
      # @attr [true/false] is_new_token
      # @attr [String] token
      # @attr [true/false] tokenization_succeeded
      class PaymentCreationOutput < OnlinePayments::SDK::Domain::DataObject

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
          if hash.has_key? 'externalReference'
            @external_reference = hash['externalReference']
          end
          if hash.has_key? 'isNewToken'
            @is_new_token = hash['isNewToken']
          end
          if hash.has_key? 'token'
            @token = hash['token']
          end
          if hash.has_key? 'tokenizationSucceeded'
            @tokenization_succeeded = hash['tokenizationSucceeded']
          end
        end
      end
    end
  end
end
