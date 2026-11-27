# Webhooks

The platform sends an HTTP POST to your endpoint when a payment, refund, payment link, payout or token changes.
Webhooks are how you learn the result when the customer never returns to your site, and how you learn about changes
made later (captures, refunds, chargebacks).

## Set up

1. In the Merchant Portal, go to Developer > Webhooks. Generate the webhook key ID and secret, and enter your
   endpoint URL (HTTPS). The secret is displayed for 60 seconds only: store it at once. Generating a new pair
   revokes the existing one immediately.
2. Store the key ID and secret like the API secret: configuration or a secret store, never in code.
3. You can also send up to five endpoint URLs with each request in `feedbacks.webhooksUrls`;
   `feedbacks.webhookUrl` is deprecated.
4. Let the platform reach your endpoint: whitelist its IP range in your firewall (see the Firewall documentation on
   the documentation portal).
5. Create the SDK's webhooks helper once at startup with a secret key store that holds the key ID and secret.
6. Check the setup with the `ValidateWebhookCredentials` operation (your key and secret) and the `SendTestWebhook`
   operation (a test event, type `payment.test`; your endpoint must answer 2xx).

```ruby
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
```

## Receive

Mandatory rule 4: verify every webhook with the SDK's webhooks helper before processing the event.

1. Read the raw request body as bytes or an unchanged string. The signature is calculated over the exact body; a
   body that was parsed and serialised again fails verification.
2. Pass the body and all request headers to the helper. It checks the `X-GCS-Signature` and `X-GCS-KeyId` headers
   and returns the parsed event. A repeated `X-GCS-Signature` or `X-GCS-KeyId` must fail verification, so never pass
   only the first value of a header. How to pass a repeated header depends on the helper: see `ruby.md`.
3. If verification fails, answer with an error status and do not process the event. Do not add a way to skip
   verification, such as a configuration flag or a check for the development environment. For local testing, use a
   test webhook key ID and secret from the Merchant Portal, or send a test event with SendTestWebhook; both go
   through normal verification.
4. Save the verified event before you answer: a database row or a persistent queue, ignoring duplicates (the
   webhooks guide identifies a duplicate by identical `payment.id` and `type`). Then answer with HTTP 2xx right away,
   as the guide recommends, and do the work in the background. Do nothing else before the answer.
5. If the event passed verification but the SDK cannot read it (API version mismatch, malformed body), the sender
   is the platform, so do not answer with an error status. Save the raw body, log it with an alert, and answer 2xx.
   A retry would send the same body and fail the same way; the saved body can be replayed after you upgrade the
   SDK. Only a failed verification gets an error status.

When the platform gets no 2xx answer in time, it sends the event again: after 10 minutes, 1 hour, 2 hours, 8 hours
and 24 hours. Each delivery has a `retry-count` header: 0 for the first attempt, higher for a retry. Log it; it
tells a new event from a retry. A 2xx tells the platform the event arrived, so do not count on another delivery after
you answered 2xx. An event that is only in memory when the process dies can be lost, and retrying failed background
work does not make the platform send it again. Keep your own retry for saved events that failed. The guide also
recommends a back-up mechanism, so run a reconciliation job: for every order that stays pending longer than a
customer normally needs to pay, read the status with `GetPaymentDetails` (see "Payment status" in `flows.md`) and
update the order.

```ruby
# Call this from your HTTP endpoint with the raw body and the two signature headers, e.g. in Sinatra:
#   post '/webhooks' do
#     status endpoint.receive(request.body.read, request.env['HTTP_X_GCS_SIGNATURE'], request.env['HTTP_X_GCS_KEYID'])
#   end
# In Rails use request.raw_post, request.headers['X-GCS-Signature'] and request.headers['X-GCS-KeyId'], and skip
# the CSRF check for this action. Pass the body unchanged: parsing it as JSON first breaks the signature check.
# The web layer has already collapsed repeated headers into one value here. If your framework exposes repeated
# headers, pass each received value as its own RequestHeader and never merge them: the helper rejects a duplicate
# X-GCS-Signature or X-GCS-KeyId, and a merged value would hide it.
# Returns the HTTP status to answer with.
# @param body [String]
# @param signature [String, nil]
# @param key_id [String, nil]
# @return [Integer]
def receive(body, signature, key_id)
  # A nil header value makes the SDK raise TypeError or NoMethodError instead of SignatureValidationException:
  # reject it first.
  return 401 if signature.nil? || signature.empty? || key_id.nil? || key_id.empty?

  request_headers = [
    OnlinePayments::SDK::Communication::RequestHeader.new('X-GCS-Signature', signature),
    OnlinePayments::SDK::Communication::RequestHeader.new('X-GCS-KeyId', key_id)
  ]
  begin
    # Checks the signature before parsing the event.
    webhooks_event = webhooks_helper.unmarshal(body, request_headers)
  rescue OnlinePayments::SDK::Webhooks::SignatureValidationException
    # Wrong or missing signature, or an unknown key ID (SecretKeyNotAvailableException is a subclass).
    # Not sent by the platform, or the wrong secret is configured. Do nothing with it.
    return 401
  rescue OnlinePayments::SDK::Webhooks::ApiVersionMismatchException,
         OnlinePayments::SDK::JSON::MarshallerSyntaxException => e
    # The signature is valid, so the platform sent it, but this SDK cannot read it. Neither class is a subclass
    # of SignatureValidationException. Do not answer with an error: a retry sends the same body and fails the same
    # way. Keep the raw body to replay it after you upgrade the SDK, and raise an alert.
    inbox.save_unreadable_body(body, e.class.name.to_s)
    logger.error("ALERT: verified webhook that the SDK cannot read (#{e.class}), raw body saved")
    return 200
  end
  # Save the verified event before you answer. Do not count on the platform sending the event again after a 2xx,
  # so an event that only lives in memory when the process dies can be lost. The inbox ignores duplicates.
  inbox.save_event(webhooks_event)
  # A background job processes the saved events. Slow or failed answers are retried by the platform.
  200
end
```

## Process

- **Duplicates are normal.** The same event can arrive more than once. Processing must be idempotent.
- **Order is not guaranteed.** A `payment.created` event can arrive after `payment.captured`.
- **Read the current status.** Treat the event as a signal: call `GetPaymentDetails` and update the order from its
  `statusOutput` (see "Payment status" in `flows.md`). This also makes duplicates and old events harmless. The
  `payment.id` of a payment changes when a maintenance operation (capture, refund, ...) is performed, and a hosted
  checkout session numbers its authorization attempts (`<id>_0`, `<id>_1`, ...). The platform strongly recommends not
  building your business operations around the ID. `GetPaymentDetails` with the ID of an earlier authorization
  attempt returns the payment's current state, with all operations in `operations` and the latest one as `id`, so
  reading the status by ID gives the current state even for an event about an older operation. Status changes made
  by the platform send webhooks too, without changing the `payment.id`.
- **Do not log the event or the request body.** The event's `payment` contains card details and customer data (see
  the logging rules in `errors.md`). Log the event `id`, `type` and the payment ID.
- **Find your order** with `payment.paymentOutput.references.merchantReference`, which holds the order reference you
  sent. The payment ID changes when you perform a maintenance operation such as a capture or refund, so do not use it as
  your only key.
- **Do not use webhooks for decisions during checkout.** While the customer waits, use `GetHostedCheckout` or
  `GetPaymentDetails`.

```ruby
# Runs in the background. Events can arrive twice and out of order, so read the current
# status instead of trusting the event; repeating this is harmless.
# @param webhooks_event [OnlinePayments::SDK::Webhooks::WebhooksEvent]
# @return [void]
def process(webhooks_event)
  payment = webhooks_event.payment
  payment_id = payment&.id
  # Refund, payment link, payout and token events carry other objects, e.g. webhooks_event.refund.
  return if payment.nil? || payment_id.nil?

  order_id = payment.payment_output&.references&.merchant_reference
  return if order_id.nil? || order_id.empty?

  details = merchant.payments.get_payment_details(payment_id)
  orders.save_payment_id(order_id, details.id || payment_id)
  orders.save_state(order_id, PaymentStatusExample.to_order_state(details.status, details.status_output))
end
```

## Event types

| Object | Types |
|---|---|
| Payment | `payment.created`, `payment.redirected`, `payment.authorization_requested`, `payment.pending_approval`, `payment.pending_completion`, `payment.pending_capture`, `payment.capture_requested`, `payment.captured`, `payment.rejected`, `payment.rejected_capture`, `payment.cancelled`, `payment.refunded` |
| Refund | `refund.refund_requested` |
| Payment link | `paymentlink.created`, `paymentlink.clicked`, `paymentlink.paid`, `paymentlink.cancelled`, `paymentlink.expired`, `paymentlink.payment.rejected`, `paymentlink.payment.cancelled` |
| Test | `payment.test` (sent by the SendTestWebhook operation) |

The event's `type` field holds the type. The object that changed is in the matching field of the event (`payment`,
`refund`, `paymentLink`, `payout`, `token`).

Webhooks guide: https://docs.direct.worldline-solutions.com/en/integration/api-developer-guide/webhooks
