# Ruby SDK reference

How to install and set up the Ruby SDK (`onlinepayments-sdk-ruby`), and the SDK calls for the API operations used in
this skill.
Source code and README: https://github.com/Online-Payments/sdk-ruby

## Install

```
gem install onlinepayments-sdk-ruby
```

Or add `gem 'onlinepayments-sdk-ruby'` to your `Gemfile` and run `bundle install`. The SDK uses `httpclient` for HTTP
and `concurrent-ruby`. `require 'onlinepayments/sdk'` loads the whole SDK. The classes have YARD comments with the
types of every property, parameter and return value; there are no RBS or Sorbet signatures.

## Namespaces

Use the full names; the examples do too.

| Namespace | Contains |
|---|---|
| `OnlinePayments::SDK` | `Factory`, `CommunicatorConfiguration`, `Client`, `CallContext`, the API exceptions (`ApiException`, `DeclinedPaymentException`, ...) |
| `OnlinePayments::SDK::Merchant` | `MerchantClient` and the sub-clients, e.g. `Payments::PaymentsClient` |
| `OnlinePayments::SDK::Domain` | Every request and response class, e.g. `CreatePaymentRequest`, `Order`, `AmountOfMoney` |
| `OnlinePayments::SDK::Authentication` | `AuthorizationType::V1HMAC` |
| `OnlinePayments::SDK::Communication` | `CommunicationException`, `RequestHeader` |
| `OnlinePayments::SDK::Webhooks` | `WebhooksHelper`, `WebhooksEvent`, `InMemorySecretKeyStore`, `SecretKeyStore`, `SignatureValidationException`, `SecretKeyNotAvailableException`, `ApiVersionMismatchException` |
| `OnlinePayments::SDK::JSON` | `DefaultMarshaller` |
| `OnlinePayments::SDK::Logging` | `RubyCommunicatorLogger`, `StdoutCommunicatorLogger`; `Obfuscation::BodyObfuscator` and the rules `Obfuscation.obfuscate_all`, ... |

## Client setup

```ruby
# Create the client once when the application starts, reuse it for every request and close it on shutdown.
# Every value is validated here, so a wrong configuration stops the application at startup.
# @return [OnlinePayments::SDK::Client]
def self.create_client
  configuration = OnlinePayments::SDK::CommunicatorConfiguration.new(
    # Test or live host, e.g. payment.direct.ecom.preprod.worldline-solutions.com (without a path).
    api_endpoint: "https://#{required_env('onlinePayments_api_endpoint_host')}",
    api_key_id: required_env('onlinePayments_api_v1hmac_apiKeyId'),
    secret_api_key: required_env('onlinePayments_api_v1hmac_secretApiKey'),
    # Required: without it, creating the client raises RuntimeError "Unknown authorizationType".
    authorization_type: OnlinePayments::SDK::Authentication::AuthorizationType::V1HMAC,
    # Your company or application name; it identifies your requests in the platform logs.
    # Required: without it, the SDK raises ArgumentError "integrator is required".
    integrator: required_env('onlinePayments_api_integrator'),
    # In seconds.
    connect_timeout: 5,
    socket_timeout: 300,
    max_connections: 10
  )
  OnlinePayments::SDK::Factory.create_client_from_configuration(configuration)
end

# The merchant ID is your PSPID. All API calls start from the merchant client.
# @param client [OnlinePayments::SDK::Client]
# @return [OnlinePayments::SDK::Merchant::MerchantClient]
def self.create_merchant_client(client)
  client.merchant(required_env('onlinePayments_api_merchantId'))
end

# The absolute public base URL of your shop, e.g. https://shop.example. The return URL of a checkout is built from
# it, never from the Host header of a request, which the sender controls.
# @return [String] without a trailing slash
def self.public_base_url
  value = required_env('shop_publicBaseUrl')
  uri = URI.parse(value)
  unless uri.is_a?(URI::HTTP) && uri.host && !uri.host.empty? && uri.query.nil? && uri.fragment.nil?
    raise "shop_publicBaseUrl must be an absolute http(s) URL without query or fragment, e.g. https://shop.example"
  end

  value.strip.chomp('/')
end

# Read credentials from the environment or, better, a secret store of your platform, and never hard-code them.
# For local development keep them in your own environment or a local secret store, not in a file in the repository.
# A blank value counts as missing.
# @param name [String]
# @return [String]
def self.required_env(name)
  value = ENV[name]
  raise "Environment variable #{name} is not set" if value.nil? || value.strip.empty?

  value
end
```

- `CommunicatorConfiguration.new` takes keyword arguments only. Set `authorization_type:` to
  `OnlinePayments::SDK::Authentication::AuthorizationType::V1HMAC` (the string `'v1HMAC'`): without it, creating the
  client raises `RuntimeError: Unknown authorizationType`. The `integrator` is mandatory: a `nil` or blank value
  raises `ArgumentError: integrator is required` when the client is created. Timeouts are in seconds. `max_connections` (connection pool size) defaults
  to 10.
- `api_endpoint` is the scheme and host only (`https://payment.direct.ecom.preprod.worldline-solutions.com`); a path
  raises `RuntimeError: api_endpoint should not contain a path`.
- `Factory.create_client_from_file(yaml_file, api_key_id, secret_api_key)` reads the other settings from a YAML file
  with the keys `onlinePayments.api.endpoint.host`, `onlinePayments.api.authorizationType`,
  `onlinePayments.api.integrator`, `onlinePayments.api.connectTimeout`, `onlinePayments.api.socketTimeout`, ... The
  merchant ID is not part of the client configuration.
- The client holds a connection pool and is thread-safe. Create it once per process (an initializer in Rails, a
  constant or `set` in Sinatra) and call `client.close` on shutdown, e.g. in `at_exit`. With a block,
  `Factory.create_client_from_configuration(configuration) { |client| ... }` closes it at the end of the block.
  `client.merchant(merchant_id)` is cheap.

## Conventions

- Calls are synchronous and return the response object. They raise exceptions (see below).
- Request and response classes take no constructor arguments. Create the object with `new` and set its attributes:
  `amount = OnlinePayments::SDK::Domain::AmountOfMoney.new` then `amount.amount = 1000`,
  `amount.currency_code = 'EUR'`. Each attribute also has a `with_<name>(value)` method that returns the object. The
  names are the API names in snake_case (`order.amountOfMoney` is `order.amount_of_money`). Exceptions: `RETURNMAC`
  is `returnmac`, `subsequentcardPaymentMethodSpecificInput` is `subsequentcard_payment_method_specific_input`.
- A misspelled attribute raises `NoMethodError` when the line runs; an unknown keyword argument raises
  `ArgumentError`. Nothing checks this before you run the code, so copy the names from the examples or the SDK source.
- All attributes can be `nil` in responses: use `&.` and compare flags with `== true`.
- Date and time attributes (e.g. `expiration_date`) take a `DateTime`, e.g. `(Time.now + 3600).to_datetime`.
- `to_h` returns a `Hash` with the API property names, e.g. to send a response object to your page as JSON
  (`response.to_h.to_json`); `from_hash(hash)` fills an object from such a hash.
- Every call has an optional `context` argument. Set the idempotence key with `CallContext.new(key)`, for example
  with `SecureRandom.uuid`. The key is a positional argument: `CallContext.new(idempotence_key: key)` stores a `Hash`
  as the key. After the call, `context.idempotence_request_timestamp` is set if the platform returned the result of an
  earlier request with the same key. A `CallContext` is not thread-safe: create one per request. `create_hosted_checkout` and `create_payment_link`
  ignore an idempotence key, so the examples call them without a context.
- Attributes marked `@deprecated` in their YARD comment are deprecated in the API. Use the replacement named there.

## API operations used in this skill

All calls start from the merchant client: `merchant = client.merchant(merchant_id)`.

| API operation | SDK call | Used in |
|---|---|---|
| CreateHostedCheckout | `merchant.hosted_checkout.create_hosted_checkout(CreateHostedCheckoutRequest)` | Hosted Checkout, recurring payments |
| GetHostedCheckout | `merchant.hosted_checkout.get_hosted_checkout(hosted_checkout_id)` | Hosted Checkout |
| CreateHostedTokenization | `merchant.hosted_tokenization.create_hosted_tokenization(CreateHostedTokenizationRequest)` | Hosted Tokenization |
| CreateHostedFieldsSession | `merchant.hosted_fields.create_hosted_fields_session(CreateHostedFieldsSessionRequest)` | Hosted Fields |
| CreateSession | `merchant.sessions.create_session(SessionRequest)` | Client integration |
| CreatePayment | `merchant.payments.create_payment(CreatePaymentRequest, context)` | Server-to-server, Hosted Tokenization, Hosted Fields, client integration |
| GetPaymentDetails | `merchant.payments.get_payment_details(payment_id)` | Payment status, webhooks, error handling |
| CapturePayment | `merchant.payments.capture_payment(payment_id, CapturePaymentRequest, context)` | After-payment operations |
| RefundPayment | `merchant.payments.refund_payment(payment_id, RefundRequest, context)` | After-payment operations |
| CancelPayment | `merchant.payments.cancel_payment(payment_id, CancelPaymentRequest, context)` | After-payment operations |
| SubsequentPayment | `merchant.subsequent.subsequent_payment(payment_id, SubsequentPaymentRequest, context)` | Recurring payments |
| CreatePaymentLink | `merchant.payment_links.create_payment_link(CreatePaymentLinkRequest)` | Payment Links |
| GetPaymentLinkById | `merchant.payment_links.get_payment_link_by_id(payment_link_id)` | Payment Links |

For anything else, use the API reference; the SDK's sub-clients and method names are the operation names there in
snake_case.

## Exceptions

All are in `OnlinePayments::SDK` unless noted. Rescue the specific ones before `ApiException`.

| Exception | When |
|---|---|
| `DeclinedPaymentException` | The error response carries a payment result: a declined payment (seen with 402 and 403), also for `subsequent_payment`. The body decides, not the status. `payment_result` holds the created payment (`.payment.id`). |
| `DeclinedRefundException` | The error response carries a refund result (the body decides, not the status). `refund_result` holds it. |
| `IdempotenceException` | 409 on a call with an idempotence key, with a single error with error code `30001002`: a request with the same idempotence key is still running. Has `idempotence_key`. |
| `ValidationException` | 400: invalid request, including an operation that the payment's state does not allow (error `id` `ACTION_NOT_ALLOWED_ON_TRANSACTION`). |
| `AuthorizationException` | 403: wrong API key ID, secret or merchant ID (error `id` `ACCESS_TO_MERCHANT_NOT_ALLOWED`), or an action that is not allowed. |
| `ReferenceException` | 404 (object not found), 410, and a 409 that is not the idempotence case above. |
| `PlatformException` | 500, 502, 503. Retry only if an error has `retriable` true; for calls with an idempotence key, use a new key. |
| `ApiException` | Base class of all the above; any other error status, including 401 and 402 without a payment result. An error response with an empty body is a plain `ApiException` whatever its status. Other `ApiException` subclasses, `ProblemDetailsException` and `DeclinedPayoutException`, are raised by operations this skill does not use. Has `status_code`, `error_id`, `errors`, `response_body`. |
| `Communication::CommunicationException` | No valid response: timeout, connection error, or an error response with a non-empty body that is not JSON (a 404 like that raises a `NotFoundException`). Not an `ApiException`; the original error is in `cause`. |
| `Webhooks::SignatureValidationException` | Webhook signature check failed. `Webhooks::SecretKeyNotAvailableException` (unknown key ID) is a subclass. |
| `Webhooks::ApiVersionMismatchException` | Valid signature, but the event has another API version. Not a `SignatureValidationException`. |
| `JSON::MarshallerSyntaxException` | Valid signature, but the body is not valid JSON. An API call raises it too when the response has a JSON content type but invalid JSON. Not a `SignatureValidationException`. |

`errors` is an array (empty if the platform sent none) of `Domain::APIError` with `error_code`, `property_name`,
`message`, `http_status_code` and `retriable`.

`ApiException#to_s` appends the status and the whole response body to the message:
`the payment platform returned an error response; status_code=400; response_body='{...}'`. `e.message`,
`"#{e}"`, `e.inspect` and the default output of an uncaught exception all use it, so logging `e`, `e.message` or
`e.to_s` writes the response body. For an error that carries a payment (a declined payment) log
only `e.error_id`, `e.status_code` and the `error_code` values; never `e`, `e.message`, `e.to_s` or `e.response_body`.
For Hosted Checkout calls the error body is a plain error response, so logging `e` is acceptable.

On the `GetHostedCheckout` response, `created_payment_output` (`Domain::CreatedPaymentOutput`) holds `payment` and
`payment_status_category` (a String, may be `nil`); decide on `payment.status_output`, not on this value.

## Webhooks

`WebhooksHelper.new(OnlinePayments::SDK::JSON::DefaultMarshaller.instance, secret_key_store)` and
`helper.unmarshal(body, request_headers)`, where `body` is the raw body string and `request_headers` is an array of
`Communication::RequestHeader.new(name, value)`. The SDK needs the `X-GCS-Signature` and `X-GCS-KeyId` headers (names
are compared case-insensitively); Rack gives them as
`request.env['HTTP_X_GCS_SIGNATURE']` and `request.env['HTTP_X_GCS_KEYID']`. The helper takes only this array, no
hash. If one of the two names occurs more than once in the array, it raises `SignatureValidationException`
(`encountered multiple occurrences of header`), as it does when one is absent: build one `RequestHeader` per received
value and never merge repeated headers. A header whose value is `nil` raises `TypeError` or `NoMethodError` instead:
answer 401 before calling `unmarshal` when a value is `nil` or empty. `secret_key_store` is
`InMemorySecretKeyStore.instance` after `store_secret_key(key_id, secret)`, or your own object that includes
`SecretKeyStore` and implements `get_secret_key(key_id)`. `unmarshal` raises `SignatureValidationException`
(`SecretKeyNotAvailableException` for an unknown key ID) when verification fails. After a valid signature it can
raise `ApiVersionMismatchException` (the SDK reads API version `v1` only) or `JSON::MarshallerSyntaxException`;
rescue both separately from the signature exception. It returns a `Webhooks::WebhooksEvent` with `id`, `type`,
`created`, `merchant_id` and one of `payment`, `refund`, `payment_link`, `payout`, `token`. Read the body with
`request.body.read` in Sinatra or `request.raw_post` in Rails, not as parsed params, and skip the Rails CSRF check
for the webhook action. See `webhooks.md` for the full handler.

## Logging

`client.enable_logging(OnlinePayments::SDK::Logging::RubyCommunicatorLogger.new(Logger.new($stdout), Logger::INFO))` or
`OnlinePayments::SDK::Logging::StdoutCommunicatorLogger.instance` logs requests and responses with card data and
secrets masked. Mask other fields with
`client.set_body_obfuscator(OnlinePayments::SDK::Logging::Obfuscation::BodyObfuscator.new({ 'name' => OnlinePayments::SDK::Logging::Obfuscation.obfuscate_all }))`.
Do not log request or response objects yourself.
