require 'onlinepayments/sdk'
require_relative 'client_setup'

module WebhooksSetup
  # [START webhooks-setup]
  # Create the helper once. The key ID and secret come from the Merchant Portal (Developer > Webhooks).
  # Keep them like the API secret: in a secret store of your platform or, locally, in your own environment, never in
  # a file in the repository. A blank value stops the application at startup.
  # In production you can pass your own object that includes OnlinePayments::SDK::Webhooks::SecretKeyStore and
  # implements get_secret_key(key_id) on top of your secret storage.
  # @return [OnlinePayments::SDK::Webhooks::WebhooksHelper]
  def self.create_webhooks_helper
    secret_key_store = OnlinePayments::SDK::Webhooks::InMemorySecretKeyStore.instance
    secret_key_store.store_secret_key(ClientSetup.required_env('ONLINEPAYMENTS_WEBHOOKS_KEY_ID'),
                                      ClientSetup.required_env('ONLINEPAYMENTS_WEBHOOKS_SECRET'))
    OnlinePayments::SDK::Webhooks::WebhooksHelper.new(OnlinePayments::SDK::JSON::DefaultMarshaller.instance,
                                                      secret_key_store)
  end
  # [END webhooks-setup]
end

# Stand-in for your durable storage of received events: a database table or a persistent queue.
# A background job reads the saved events and processes them, see WebhookEventProcessor.
class WebhookInbox
  # Save a verified event. Ignore a duplicate: the platform can send the same event more than once, and the
  # webhooks guide identifies a duplicate by identical payment.id and type.
  # @param webhooks_event [OnlinePayments::SDK::Webhooks::WebhooksEvent]
  # @return [void]
  def save_event(webhooks_event)
    raise NotImplementedError
  end

  # Save the raw body of an event that passed verification but that the SDK cannot read, to replay it after you
  # upgrade the SDK.
  # @param raw_body [String]
  # @param reason [String]
  # @return [void]
  def save_unreadable_body(raw_body, reason)
    raise NotImplementedError
  end
end
