# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] issuer_id
      # @deprecated Deprecated, this is no longer used.
      class RedirectPaymentProduct809SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :issuer_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(issuer_id: nil)
          super()
          @issuer_id = issuer_id
        end

        # Sets the property and returns this same instance.
        def with_issuer_id(value)
          @issuer_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['issuerId'] = @issuer_id unless @issuer_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'issuerId'
            @issuer_id = hash['issuerId']
          end
        end
      end
    end
  end
end
