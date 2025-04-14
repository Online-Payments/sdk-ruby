#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] return_url
      class RedirectionData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :return_url

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
