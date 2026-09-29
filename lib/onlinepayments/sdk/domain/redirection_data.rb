#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] return_url
      class RedirectionData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :return_url

        # Sets the property and returns this same instance.
        def with_return_url(value)
          @return_url = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['returnUrl'] = @return_url unless @return_url.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'returnUrl'
            @return_url = hash['returnUrl']
          end
        end
      end
    end
  end
end
