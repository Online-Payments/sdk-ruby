# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] revocation_reason
      class RevokeMandateRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :revocation_reason

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(revocation_reason: nil)
          super()
          @revocation_reason = revocation_reason
        end

        # Sets the property and returns this same instance.
        def with_revocation_reason(value)
          @revocation_reason = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['revocationReason'] = @revocation_reason unless @revocation_reason.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'revocationReason'
            @revocation_reason = hash['revocationReason']
          end
        end
      end
    end
  end
end
