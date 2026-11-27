# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] skip_email_validation
      class RedirectPaymentProduct11SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :skip_email_validation

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(skip_email_validation: nil)
          super()
          @skip_email_validation = skip_email_validation
        end

        # Sets the property and returns this same instance.
        def with_skip_email_validation(value)
          @skip_email_validation = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['skipEmailValidation'] = @skip_email_validation unless @skip_email_validation.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'skipEmailValidation'
            @skip_email_validation = hash['skipEmailValidation']
          end
        end
      end
    end
  end
end
