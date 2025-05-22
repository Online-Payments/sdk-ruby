#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] webhook_url
      # @attr [Array<String>] webhooks_urls
      class Feedbacks < OnlinePayments::SDK::Domain::DataObject

        # @deprecated The URL where the webhook will be dispatched for all status change events related to this payment.
        attr_accessor :webhook_url

        attr_accessor :webhooks_urls

        # @return (Hash)
        def to_h
          hash = super
          hash['webhookUrl'] = @webhook_url unless @webhook_url.nil?
          hash['webhooksUrls'] = @webhooks_urls unless @webhooks_urls.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'webhookUrl'
            @webhook_url = hash['webhookUrl']
          end
          if hash.has_key? 'webhooksUrls'
            raise TypeError, "value '%s' is not an Array" % [hash['webhooksUrls']] unless hash['webhooksUrls'].is_a? Array
            @webhooks_urls = []
            hash['webhooksUrls'].each do |e|
              @webhooks_urls << e
            end
          end
        end
      end
    end
  end
end
