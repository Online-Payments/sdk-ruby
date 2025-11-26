#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] polling_url
      class PendingAuthentication < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :polling_url

        # @return (Hash)
        def to_h
          hash = super
          hash['pollingUrl'] = @polling_url unless @polling_url.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'pollingUrl'
            @polling_url = hash['pollingUrl']
          end
        end
      end
    end
  end
end
