#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] key
      # @attr [String] secret
      class ValidateCredentialsRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :key

        attr_accessor :secret

        # @return (Hash)
        def to_h
          hash = super
          hash['key'] = @key unless @key.nil?
          hash['secret'] = @secret unless @secret.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'key'
            @key = hash['key']
          end
          if hash.has_key? 'secret'
            @secret = hash['secret']
          end
        end
      end
    end
  end
end
