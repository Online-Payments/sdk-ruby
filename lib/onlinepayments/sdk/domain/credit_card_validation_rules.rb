# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] cvv_mandatory_for_existing_token
      # @attr [true/false, nil] cvv_mandatory_for_new_token
      class CreditCardValidationRules < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :cvv_mandatory_for_existing_token

        attr_accessor :cvv_mandatory_for_new_token

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(cvv_mandatory_for_existing_token: nil, cvv_mandatory_for_new_token: nil)
          super()
          @cvv_mandatory_for_existing_token = cvv_mandatory_for_existing_token
          @cvv_mandatory_for_new_token = cvv_mandatory_for_new_token
        end

        # Sets the property and returns this same instance.
        def with_cvv_mandatory_for_existing_token(value)
          @cvv_mandatory_for_existing_token = value
          self
        end

        # Sets the property and returns this same instance.
        def with_cvv_mandatory_for_new_token(value)
          @cvv_mandatory_for_new_token = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['cvvMandatoryForExistingToken'] = @cvv_mandatory_for_existing_token unless @cvv_mandatory_for_existing_token.nil?
          hash['cvvMandatoryForNewToken'] = @cvv_mandatory_for_new_token unless @cvv_mandatory_for_new_token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'cvvMandatoryForExistingToken'
            @cvv_mandatory_for_existing_token = hash['cvvMandatoryForExistingToken']
          end
          if hash.key? 'cvvMandatoryForNewToken'
            @cvv_mandatory_for_new_token = hash['cvvMandatoryForNewToken']
          end
        end
      end
    end
  end
end
