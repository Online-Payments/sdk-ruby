# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] csr
      class CsrRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :csr

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(csr: nil)
          super()
          @csr = csr
        end

        # Sets the property and returns this same instance.
        def with_csr(value)
          @csr = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['csr'] = @csr unless @csr.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'csr'
            @csr = hash['csr']
          end
        end
      end
    end
  end
end
