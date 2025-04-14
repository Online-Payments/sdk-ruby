#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] webhook_url
      class Feedbacks < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :webhook_url

        # @return (Hash)
        def to_h
          hash = super
          hash['webhookUrl'] = @webhook_url unless @webhook_url.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'webhookUrl'
            @webhook_url = hash['webhookUrl']
          end
        end
      end
    end
  end
end
