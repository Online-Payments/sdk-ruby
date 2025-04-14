#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] url
      class SendTestRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :url

        # @return (Hash)
        def to_h
          hash = super
          hash['url'] = @url unless @url.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'url'
            @url = hash['url']
          end
        end
      end
    end
  end
end
