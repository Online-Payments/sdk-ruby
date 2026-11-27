# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] key
      # @attr [String, nil] secret
      class ValidateCredentialsRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :key

        attr_accessor :secret

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(key: nil, secret: nil)
          super()
          @key = key
          @secret = secret
        end

        # Sets the property and returns this same instance.
        def with_key(value)
          @key = value
          self
        end

        # Sets the property and returns this same instance.
        def with_secret(value)
          @secret = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['key'] = @key unless @key.nil?
          hash['secret'] = @secret unless @secret.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'key'
            @key = hash['key']
          end
          if hash.key? 'secret'
            @secret = hash['secret']
          end
        end
      end
    end
  end
end
