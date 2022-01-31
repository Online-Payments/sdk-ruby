module OnlinePayments::SDK
  module Webhooks
    # Online Payments platform factory for several webhooks components
    module Webhooks
      DefaultMarshaller ||= OnlinePayments::SDK::DefaultImpl::DefaultMarshaller

      # Creates a WebhooksHelperBuilder that uses the
      # given SecretkeyStore
      def self.create_helper_builder(secret_key_store)
        WebhooksHelperBuilder.new
                             .with_marshaller(DefaultMarshaller.INSTANCE)
                             .with_secret_key_store(secret_key_store)
      end

      # Creates a WebhooksHelper that uses the given
      # SecretkeyStore.
      def self.create_helper(secret_key_store)
        create_helper_builder(secret_key_store).build
      end
    end
  end
end
