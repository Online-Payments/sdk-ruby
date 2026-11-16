# Integration flows

Steps and code for each integration method of Online Payments, for the Ruby SDK.
The client setup is in `ruby.md`. In the code, the order store stands for your own database code; replace
it.

Contents:

- Decision guide
- Hosted Checkout
- Payment attempt and idempotence key (server-to-server, Hosted Tokenization, Hosted Fields, client integration)
- Handling a CreatePayment response (server-to-server, Hosted Tokenization, Hosted Fields, client integration)
- Server-to-server
- Hosted Tokenization
- Hosted Fields
- Client integration
- Payment Links
- After-payment operations: capture, refund, cancel
- Recurring payments
- Payment status

## Decision guide

1. Does the user want the least work and no card data on their servers? Use **Hosted Checkout**.
2. Must the card form be part of their own checkout page? Use **Hosted Tokenization** (one iframe) or
   **Hosted Fields** (one field per iframe, more styling control).
3. Is it a native mobile app, or must the form be fully their own? Use **Client integration**.
4. Is the payer not on a checkout page at all (invoice, email, call centre)? Use **Payment Links**.
5. Do they already hold card data under PCI DSS SAQ D, or charge a stored token? Use **Server-to-server**.
6. Subscriptions and other charges without the customer: first payment with one of the methods above, later charges
   as in **Recurring payments**.

Card payments created from your server (all methods except Hosted Checkout and Payment Links) need 3-D Secure data:
the customer's browser details and a return URL.

## Hosted Checkout

The customer pays on a page hosted by the platform. Your server creates a session, redirects the customer, and reads
the result when the customer comes back.

1. Create the session with the amount, your order reference and a return URL that contains your own order reference.
   Build the return URL from configuration: an absolute public base URL of your shop, checked at startup. Never
   build it from the request's `Host` header, which the sender controls. Escape the order reference in the query
   string. The platform rejects a `returnUrl` without a protocol but does not check that it points to your shop, so
   check your base URL yourself. The order reference (`merchantReference`) is at most 40 characters; a longer one is
   rejected with a 400.
2. Store `HostedCheckoutId` and `RETURNMAC` with the order after the call (mandatory rule 2).
3. Redirect the customer to `redirectUrl` exactly as returned (mandatory rule 3). Do not open it in an iframe.
   It is valid for the session timeout: 3 hours by default (`sessionTimeout`, 1 to 1440 minutes).

```ruby
# Returns the URL to redirect the customer to.
# @param order_id [String]
# @param amount_in_cents [Integer]
# @param currency_code [String]
# @return [String]
def start_checkout(order_id, amount_in_cents, currency_code)
  amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
  amount_of_money.amount = amount_in_cents
  amount_of_money.currency_code = currency_code

  references = OnlinePayments::SDK::Domain::OrderReferences.new
  references.merchant_reference = order_id

  order = OnlinePayments::SDK::Domain::Order.new
  order.amount_of_money = amount_of_money
  order.references = references

  checkout_input = OnlinePayments::SDK::Domain::HostedCheckoutSpecificInput.new
  checkout_input.return_url = build_return_url(order_id)
  checkout_input.locale = 'en-GB'

  request = OnlinePayments::SDK::Domain::CreateHostedCheckoutRequest.new
  request.order = order
  request.hosted_checkout_specific_input = checkout_input

  response = create_hosted_checkout_with_retry(request)
  hosted_checkout_id = response.hosted_checkout_id
  returnmac = response.returnmac
  redirect_url = response.redirect_url
  if hosted_checkout_id.nil? || returnmac.nil? || redirect_url.nil?
    raise "Incomplete hosted checkout response for order #{order_id}"
  end

  # Store both values with the order before the customer leaves your site.
  orders.save_hosted_checkout(order_id, hosted_checkout_id, returnmac)
  # Redirect to this URL exactly as returned. Do not build it from partial_redirect_url.
  redirect_url
end

# The return URL comes from your configuration (an absolute public base URL), never from the Host header of the
# request, which the sender controls. The order reference is escaped for the query string.
# @param order_id [String]
# @return [String]
def build_return_url(order_id)
  "#{public_base_url}/return?#{URI.encode_www_form('orderId' => order_id)}"
end
```

If the create call got no answer, or failed with an error marked `retriable`, send it again.
`CreateHostedCheckout` does not support idempotent requests (mandatory rule 1), so send no idempotence key: every
resend creates a new session. That is harmless until the customer pays in it; the unused session expires. The
waiting happens inside the customer's request, so the browser waits too: keep the attempts few and the delays
short.

```ruby
# CreateHostedCheckout does not support idempotent requests: the platform ignores an idempotence key, so every
# resend creates a new session. That is harmless until the customer pays in it; the unused session expires.
# Send it again after no answer or after an error marked retriable. The waiting happens inside the customer's
# request, so the browser waits too: keep the attempts few and the delays short, or move the call to a
# background job.
# @param request [OnlinePayments::SDK::Domain::CreateHostedCheckoutRequest]
# @return [OnlinePayments::SDK::Domain::CreateHostedCheckoutResponse]
def create_hosted_checkout_with_retry(request)
  attempt = 1
  begin
    merchant.hosted_checkout.create_hosted_checkout(request)
  rescue OnlinePayments::SDK::ApiException => e
    # The error of a Hosted Checkout call is a plain error response, so logging it is fine here: log at least the
    # error ID, status and error codes.
    codes = e.errors.map { |error| "#{error.error_code} #{error.property_name}" }.join('; ')
    logger.error("create_hosted_checkout failed: status #{e.status_code}, error_id #{e.error_id}: #{codes}")
    # Only an error marked retriable is sent again. Other errors reach the caller.
    raise if attempt >= 3 || e.errors.none? { |error| error.retriable == true }

    sleep(attempt)
    attempt += 1
    retry
  rescue OnlinePayments::SDK::Communication::CommunicationException
    # No answer (timeout or connection error): the session may or may not exist. Send the request again.
    raise if attempt >= 3

    sleep(attempt)
    attempt += 1
    retry
  end
end
```

4. When the customer comes back, the platform appends `RETURNMAC` and `hostedCheckoutId` to the query string of your
   return URL, e.g. `https://shop.example/return?orderId=123&RETURNMAC=37159fa4-...&hostedCheckoutId=4501638561`. Load the
   stored values for the order and compare them in constant time: if `RETURNMAC` is missing or differs from the
   stored value, the request does not belong to this checkout; reject it and do not change the order.
5. Then call `GetHostedCheckout` to read the result. `status` is `PAYMENT_CREATED`, `IN_PROGRESS` or
   `CANCELLED_BY_CONSUMER`. When a payment was created, use its status as described in "Payment status". The created
   payment output also carries a payment status category (`paymentStatusCategory`: `SUCCESSFUL`, `REJECTED` or
   `STATUS_UNKNOWN`); decide on the payment's `statusOutput`, as everywhere else. `CANCELLED_BY_CONSUMER` means the
   customer cancelled or the session expired. For an expired session the created payment output holds a cancelled
   payment with the error id `CANCELLED_BY_EXPIRATION`; the order is cancelled. A session can hold several payment
   attempts (`<id>_0`, `<id>_1`, ...) that belong to one payment; `GetHostedCheckout` returns the latest attempt
   (see "Process" in `webhooks.md`).
6. Customers can close the browser before returning. The webhooks (see `webhooks.md`) cover that case.
   `GetHostedCheckout` can also fail with a not-found error (the API reference documents a 404 for this call). Then
   read the payment with `GetPaymentDetails` and the payment ID that your webhook handler stored. If no payment ID
   is stored yet, keep the order pending and let the webhook or your reconciliation job settle it; do not mark it
   failed. Handle only the not-found error this way; let other errors reach the caller. An expired session is not an
   error: `GetHostedCheckout` answers it with `CANCELLED_BY_CONSUMER` (step 5).

```ruby
# Called when the customer comes back on your return URL, e.g. with params['RETURNMAC'] in Sinatra or Rails.
# @param order_id [String]
# @param returnmac_from_query [String, nil]
# @return [Symbol] one of the OrderPaymentState values
def handle_return(order_id, returnmac_from_query)
  stored = orders.get_hosted_checkout(order_id)
  # The platform appends RETURNMAC to the return URL. It identifies the returning customer:
  # a missing or different value means the request does not belong to this checkout.
  if returnmac_from_query.nil? || returnmac_from_query.empty? ||
     !constant_time_equal?(stored.returnmac, returnmac_from_query)
    raise "RETURNMAC does not match the stored value for order #{order_id}"
  end

  # Never trust the redirect alone: read the result from the platform.
  begin
    hosted_checkout = merchant.hosted_checkout.get_hosted_checkout(stored.hosted_checkout_id)
  rescue OnlinePayments::SDK::ReferenceException => e
    # The API reference documents a 404 for this call. If it fails with not found, read the payment instead,
    # with the payment ID that your webhook handler stored. Without a stored payment ID
    # this returns :pending, and the webhook or your reconciliation job settles the order: do not mark it failed.
    # Other errors reach the caller, including the 409 and 410 that the SDK also raises as ReferenceException.
    raise unless e.status_code == 404

    logger.warn("get_hosted_checkout failed for order #{order_id}: status #{e.status_code}, error_id #{e.error_id}")
    return payment_status.refresh_payment_state(order_id)
  end
  payment = hosted_checkout.created_payment_output&.payment
  payment_id = payment&.id
  if hosted_checkout.status == 'PAYMENT_CREATED' && payment && payment_id
    orders.save_payment_id(order_id, payment_id)
    state = PaymentStatusExample.to_order_state(payment.status, payment.status_output)
    orders.save_state(order_id, state)
    return state
  end
  if hosted_checkout.status == 'CANCELLED_BY_CONSUMER'
    # The customer cancelled, or the session expired (the created payment is then cancelled with the error id
    # CANCELLED_BY_EXPIRATION).
    orders.save_state(order_id, OrderPaymentState::CANCELLED)
    return OrderPaymentState::CANCELLED
  end

  # IN_PROGRESS: the customer has not finished. A webhook will report the result.
  OrderPaymentState::PENDING
end

# Compares in constant time, so the comparison does not reveal the stored value. OpenSSL.secure_compare would do
# this, but it does not exist on Ruby 2.3 to 2.7 (the SDK supports Ruby 2.3 and higher). Hashing both values
# first makes them the same length, so a different length is not visible either.
# @param expected [String]
# @param actual [String]
# @return [Boolean]
def constant_time_equal?(expected, actual)
  expected_bytes = OpenSSL::Digest::SHA256.digest(expected).bytes
  actual_bytes = OpenSSL::Digest::SHA256.digest(actual).bytes
  difference = 0
  expected_bytes.each_with_index { |byte, index| difference |= byte ^ actual_bytes.fetch(index) }
  difference.zero?
end
```

## Payment attempt and idempotence key

Server-to-server, Hosted Tokenization, Hosted Fields and client integration all create the payment with a
`CreatePayment` call, which needs an idempotence key (mandatory rule 1). For `CreatePayment` one operation is one
payment attempt:

- Start an attempt when the customer begins to pay, for example when you show the payment form. Create the key and
  store it with the order before the first `CreatePayment` call.
- The request that creates the payment reads the stored key. A double submit, a retry after a timeout and a restart
  then send the same key, so the platform does not create a second payment: it returns the first result, or 409
  while the first request is still running (see `errors.md`).
- Start a new attempt before the customer tries again after a decline or a rejected request. With the old key the
  platform returns the old answer, even when the request is different.

```ruby
# One idempotence key per payment attempt, stored with the order.
module PaymentAttempt
  # Call start when the customer begins to pay, for example when you show the payment form, and again before a new
  # attempt after a decline or a rejected request. It stores the key before any create_payment call.
  # @param order_id [String]
  # @param orders [OrderStore]
  # @return [String]
  def self.start(order_id, orders)
    key = SecureRandom.uuid
    orders.save_idempotence_key(order_id, key)
    key
  end

  # The request that creates the payment reads the stored key. A double submit, a retry after a timeout and a restart
  # then send the same key, so the platform does not create a second payment.
  # @param order_id [String]
  # @param orders [OrderStore]
  # @return [String]
  def self.key_for(order_id, orders)
    key = orders.get_idempotence_key(order_id)
    raise "No payment attempt was started for order #{order_id}" if key.nil?

    key
  end
end
```

## Handling a CreatePayment response

Server-to-server, Hosted Tokenization, Hosted Fields and client integration all end with a `CreatePayment` call.
Handle the response the same way:

- Store the payment ID with the order.
- If `merchantAction.actionType` is `REDIRECT`, redirect the customer to `merchantAction.redirectData.redirectURL`
  (3-D Secure challenge or a third-party page). When the customer comes back on your return URL, read the status with
  `GetPaymentDetails` (see "Payment status").
- Otherwise the result is already in `payment.statusOutput`.
- The other action types are not covered by the examples; the API reference describes their data:
  - `SHOW_FORM`: show the customer a form (data in `merchantAction.showFormData`); the customer's input goes back to
    the platform in a `CompletePayment` request.
  - `SHOW_INSTRUCTIONS`: show the customer the payment instructions (`merchantAction.showInstructionsData.showData`).
  - `SHOW_TRANSACTION_RESULTS`: show the customer the transaction result.
  - `MOBILE_THREEDS_CHALLENGE`: the customer completes a 3-D Secure challenge inside your mobile app; pass
    `merchantAction.mobileThreeDSecureChallengeParameters` to the EMVCo-certified Mobile SDK.
  - `CALL_THIRD_PARTY`: your server calls a third party with the data from the response.

```ruby
# Use for every create_payment response: server-to-server, Hosted Tokenization, Hosted Fields and client integration.
# @param response [OnlinePayments::SDK::Domain::CreatePaymentResponse]
# @param order_id [String]
# @param orders [OrderStore]
# @return [PaymentStep]
def self.handle_create_payment_response(response, order_id, orders)
  payment = response.payment
  payment_id = payment&.id
  raise "The create payment response for order #{order_id} has no payment" if payment.nil? || payment_id.nil?

  orders.save_payment_id(order_id, payment_id)

  redirect_url = response.merchant_action&.redirect_data&.redirect_url
  if response.merchant_action&.action_type == 'REDIRECT' && redirect_url && !redirect_url.empty?
    # 3-D Secure challenge or a third-party page. Redirect to the URL exactly as returned.
    # The customer comes back on your return URL; then read the status with get_payment_details.
    return PaymentStep.new(redirect_url: redirect_url)
  end

  # No customer action needed: the result is already known.
  state = PaymentStatusExample.to_order_state(payment.status, payment.status_output)
  orders.save_state(order_id, state)
  PaymentStep.new(state: state)
end
```

3-D Secure needs the customer's browser details in `order.customer.device`:

```ruby
# 3-D Secure needs details about the customer's browser. Collect the browser values with JavaScript on the checkout
# page and read the rest from the HTTP request (e.g. in Sinatra or Rails: request.env['HTTP_ACCEPT'],
# request.user_agent, request.ip).
# @param accept_header [String]
# @param user_agent [String]
# @param ip_address [String]
# @param browser [BrowserInfo]
# @return [OnlinePayments::SDK::Domain::CustomerDevice]
def self.build_customer_device(accept_header, user_agent, ip_address, browser)
  browser_data = OnlinePayments::SDK::Domain::BrowserData.new
  browser_data.color_depth = browser.color_depth
  browser_data.java_enabled = browser.java_enabled
  browser_data.java_script_enabled = true
  browser_data.screen_height = browser.screen_height.to_s
  browser_data.screen_width = browser.screen_width.to_s

  device = OnlinePayments::SDK::Domain::CustomerDevice.new
  device.accept_header = accept_header
  device.user_agent = user_agent
  device.ip_address = ip_address
  device.locale = browser.locale
  device.timezone_offset_utc_minutes = browser.timezone_offset_utc_minutes.to_s
  device.browser_data = browser_data
  device
end
```

## Server-to-server

Your server sends the card data in `CreatePayment`. Only for merchants certified for PCI DSS SAQ D. Never log the
request (mandatory rule 6). `paymentProductId` is required with card data: without it the platform answers 400
`UNKNOWN_PRODUCT_ID`. The idempotence key is the stored key of the payment attempt (see "Payment attempt and idempotence
key").

```ruby
# Card data on your server puts you in scope of PCI DSS SAQ D.
# Use Hosted Tokenization or Hosted Fields unless you are certified for it.
# @param order_id [String]
# @param amount_in_cents [Integer]
# @param currency_code [String]
# @param payment_product_id [Integer] e.g. 1 = Visa, 3 = Mastercard.
# @param card [CardInput]
# @param device [OnlinePayments::SDK::Domain::CustomerDevice]
# @param return_url [String]
# @return [PaymentStep]
def pay_with_card(order_id, amount_in_cents, currency_code, payment_product_id, card, device, return_url)
  amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
  amount_of_money.amount = amount_in_cents
  amount_of_money.currency_code = currency_code

  references = OnlinePayments::SDK::Domain::OrderReferences.new
  references.merchant_reference = order_id

  customer = OnlinePayments::SDK::Domain::Customer.new
  customer.device = device

  order = OnlinePayments::SDK::Domain::Order.new
  order.amount_of_money = amount_of_money
  order.references = references
  order.customer = customer

  card_data = OnlinePayments::SDK::Domain::Card.new
  card_data.card_number = card.number
  card_data.cardholder_name = card.holder_name
  card_data.expiry_date = card.expiry_date
  card_data.cvv = card.cvv

  redirection_data = OnlinePayments::SDK::Domain::RedirectionData.new
  redirection_data.return_url = return_url
  three_d_secure = OnlinePayments::SDK::Domain::ThreeDSecure.new
  three_d_secure.redirection_data = redirection_data

  card_input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInput.new
  card_input.payment_product_id = payment_product_id
  card_input.card = card_data
  # SALE: authorised and captured at once. Acquirers that do not support it ignore it.
  # FINAL_AUTHORIZATION: capture the full amount within 7 days.
  # PRE_AUTHORIZATION: can be reversed; capture the authorised amount or less within 30 days.
  card_input.authorization_mode = 'SALE'
  card_input.three_d_secure = three_d_secure

  request = OnlinePayments::SDK::Domain::CreatePaymentRequest.new
  request.order = order
  request.card_payment_method_specific_input = card_input

  # The idempotence key is a positional argument.
  context = OnlinePayments::SDK::CallContext.new(PaymentAttempt.key_for(order_id, orders))
  # Raises DeclinedPaymentException if the payment is declined, and other ApiException subclasses for errors;
  # see ErrorHandlingExample for handling each case.
  response = merchant.payments.create_payment(request, context)
  CreatePaymentResponseHandler.handle_create_payment_response(response, order_id, orders)
end
```

If the payment is declined, the SDK reports a declined-payment error that holds the created payment; see `errors.md`.

## Hosted Tokenization

The card form is an iframe from the platform on your checkout page. Your server never sees the card data.

1. Server: create a session and send `hostedTokenizationUrl` and `sri` to the page.

```ruby
# Creates the session for the card form iframe on your checkout page.
# @return [OnlinePayments::SDK::Domain::CreateHostedTokenizationResponse]
def create_session
  request = OnlinePayments::SDK::Domain::CreateHostedTokenizationRequest.new
  request.locale = 'en-GB'
  # Optional: request.variant = 'MyTemplate.html', the file name of a custom template.
  response = merchant.hosted_tokenization.create_hosted_tokenization(request)
  # Send hosted_tokenization_url (iframe URL) and sri (script integrity) to the page.
  response
end
```

2. Page: load `tokenizer.min.js` from the platform (not from your own server) with the `sri` value as `integrity`,
   create a `Tokenizer` with the `hostedTokenizationUrl` and the ID of the `div` for the iframe, and call
   `initialize()`. When the customer pays, call `submitTokenization()` and post `result.hostedTokenizationId` to your
   server, together with the browser details for 3-D Secure.
3. Server: create the payment with the `hostedTokenizationId` and handle the response as described above. If
   `submitTokenization()` has not completed, the platform answers 400 with the error id
   `HOSTED_TOKENIZATION_SESSION_NOT_SUBMITTED`; an unknown id gives `HOSTED_TOKENIZATION_SESSION_NOT_FOUND`. The
   idempotence key is the stored key of the payment attempt (see "Payment attempt and idempotence key").

```ruby
# The page calls tokenizer.submitTokenization() and posts result.hostedTokenizationId to your server.
# @param order_id [String]
# @param hosted_tokenization_id [String]
# @param amount_in_cents [Integer]
# @param currency_code [String]
# @param device [OnlinePayments::SDK::Domain::CustomerDevice]
# @param return_url [String]
# @return [PaymentStep]
def pay(order_id, hosted_tokenization_id, amount_in_cents, currency_code, device, return_url)
  amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
  amount_of_money.amount = amount_in_cents
  amount_of_money.currency_code = currency_code

  references = OnlinePayments::SDK::Domain::OrderReferences.new
  references.merchant_reference = order_id

  customer = OnlinePayments::SDK::Domain::Customer.new
  customer.device = device

  order = OnlinePayments::SDK::Domain::Order.new
  order.amount_of_money = amount_of_money
  order.references = references
  order.customer = customer

  redirection_data = OnlinePayments::SDK::Domain::RedirectionData.new
  redirection_data.return_url = return_url
  three_d_secure = OnlinePayments::SDK::Domain::ThreeDSecure.new
  three_d_secure.redirection_data = redirection_data

  card_input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInput.new
  card_input.authorization_mode = 'SALE'
  card_input.three_d_secure = three_d_secure

  request = OnlinePayments::SDK::Domain::CreatePaymentRequest.new
  request.hosted_tokenization_id = hosted_tokenization_id
  request.order = order
  request.card_payment_method_specific_input = card_input

  context = OnlinePayments::SDK::CallContext.new(PaymentAttempt.key_for(order_id, orders))
  response = merchant.payments.create_payment(request, context)
  CreatePaymentResponseHandler.handle_create_payment_response(response, order_id, orders)
end
```

## Hosted Fields

Each card field (card number, cardholder name, card brands, expiry date, CVV) is a separate iframe that you place in
your page and customise with CSS.

1. Server: create a session (`locale` is required) and send `sdkUrl`, `sdkSri` and `sessionData` to the page. Pass
   `sessionData` on unchanged.

```ruby
# Creates the session that the Hosted Fields script on your checkout page needs.
# @param checkout_page_origin [String] the origin of your checkout page, e.g. https://shop.example
# @return [OnlinePayments::SDK::Domain::CreateHostedFieldsSessionResponse]
def create_session(checkout_page_origin)
  request = OnlinePayments::SDK::Domain::CreateHostedFieldsSessionRequest.new
  request.locale = 'en-GB'
  request.origin = checkout_page_origin
  response = merchant.hosted_fields.create_hosted_fields_session(request)
  # Send sdk_url, sdk_sri and session_data to the page. Pass session_data on unchanged
  # (as JSON: response.session_data.to_h).
  response
end
```

2. Page: load the script from `sdkUrl` with `sdkSri` as `integrity` and `crossorigin="anonymous"`. Create the Hosted
   Fields instance with `sessionData` and the IDs of your field containers. On submit call `tokenize(storeToken)`;
   `true` stores the card for later use and needs the customer's consent. Then tell your server to pay.
3. Server: create the payment with the `hostedFieldsSessionId` and handle the response as described above. The
   session response has the ID at its top level and, with the same value, inside `sessionData`. If `tokenize()` has not
   completed, the platform answers 400 with the error id `HOSTED_FIELDS_SESSION_NOT_SUBMITTED` (property
   `hostedFieldsSessionId`). The idempotence key is the stored key of the payment attempt (see "Payment attempt and
   idempotence key").

```ruby
# The page calls tokenize() and tells your server the card is ready.
# hosted_fields_session_id is hosted_fields_session_id of the create_session response; session_data.hosted_fields_session_id holds the same value.
# @param order_id [String]
# @param hosted_fields_session_id [String]
# @param amount_in_cents [Integer]
# @param currency_code [String]
# @param device [OnlinePayments::SDK::Domain::CustomerDevice]
# @param return_url [String]
# @return [PaymentStep]
def pay(order_id, hosted_fields_session_id, amount_in_cents, currency_code, device, return_url)
  amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
  amount_of_money.amount = amount_in_cents
  amount_of_money.currency_code = currency_code

  references = OnlinePayments::SDK::Domain::OrderReferences.new
  references.merchant_reference = order_id

  customer = OnlinePayments::SDK::Domain::Customer.new
  customer.device = device

  order = OnlinePayments::SDK::Domain::Order.new
  order.amount_of_money = amount_of_money
  order.references = references
  order.customer = customer

  redirection_data = OnlinePayments::SDK::Domain::RedirectionData.new
  redirection_data.return_url = return_url
  three_d_secure = OnlinePayments::SDK::Domain::ThreeDSecure.new
  three_d_secure.redirection_data = redirection_data

  card_input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInput.new
  card_input.authorization_mode = 'SALE'
  card_input.three_d_secure = three_d_secure

  request = OnlinePayments::SDK::Domain::CreatePaymentRequest.new
  request.hosted_fields_session_id = hosted_fields_session_id
  request.order = order
  request.card_payment_method_specific_input = card_input

  context = OnlinePayments::SDK::CallContext.new(PaymentAttempt.key_for(order_id, orders))
  response = merchant.payments.create_payment(request, context)
  CreatePaymentResponseHandler.handle_create_payment_response(response, order_id, orders)
end
```

## Client integration

A Client SDK (JavaScript, iOS, Android, Flutter, ...) encrypts the card data on the customer's device. Your server
creates the session and the payment.

1. Server: create a client session and send its values to the app. The API key never leaves your server.

```ruby
# Creates the session that a Client SDK (JavaScript, iOS, Android, Flutter...) needs to encrypt card data.
# @return [OnlinePayments::SDK::Domain::SessionResponse]
def create_client_session
  session = merchant.sessions.create_session(OnlinePayments::SDK::Domain::SessionRequest.new)
  # Send client_session_id, customer_id, client_api_url and asset_url to the app. Never send your API key.
  session
end
```

2. App: initialise the Client SDK with the session, collect the card data, and create the encrypted customer input.
   Post that string to your server. Client SDK documentation:
   https://docs.direct.worldline-solutions.com/en/integration/how-to-integrate/client-sdks/javascript
3. Server: create the payment with `encryptedCustomerInput` and handle the response as described above. The string
   holds encrypted card data and can be submitted only once: do not store it. It is at most 5000 characters. A string
   the platform cannot read is a 400 with the error id `INVALID_CONSUMER_INPUT_ENCRYPTION`. The idempotence key is the
   stored key of the payment attempt (see "Payment attempt and idempotence key").

```ruby
# The Client SDK returns an encrypted string; the app posts it to your server.
# @param order_id [String]
# @param encrypted_customer_input [String]
# @param amount_in_cents [Integer]
# @param currency_code [String]
# @param device [OnlinePayments::SDK::Domain::CustomerDevice]
# @param return_url [String]
# @return [PaymentStep]
def pay(order_id, encrypted_customer_input, amount_in_cents, currency_code, device, return_url)
  amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
  amount_of_money.amount = amount_in_cents
  amount_of_money.currency_code = currency_code

  references = OnlinePayments::SDK::Domain::OrderReferences.new
  references.merchant_reference = order_id

  customer = OnlinePayments::SDK::Domain::Customer.new
  customer.device = device

  order = OnlinePayments::SDK::Domain::Order.new
  order.amount_of_money = amount_of_money
  order.references = references
  order.customer = customer

  redirection_data = OnlinePayments::SDK::Domain::RedirectionData.new
  redirection_data.return_url = return_url
  three_d_secure = OnlinePayments::SDK::Domain::ThreeDSecure.new
  three_d_secure.redirection_data = redirection_data

  card_input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInput.new
  card_input.authorization_mode = 'SALE'
  card_input.three_d_secure = three_d_secure

  request = OnlinePayments::SDK::Domain::CreatePaymentRequest.new
  request.encrypted_customer_input = encrypted_customer_input
  request.order = order
  request.card_payment_method_specific_input = card_input

  context = OnlinePayments::SDK::CallContext.new(PaymentAttempt.key_for(order_id, orders))
  response = merchant.payments.create_payment(request, context)
  CreatePaymentResponseHandler.handle_create_payment_response(response, order_id, orders)
end
```

## Payment Links

The platform hosts the payment page behind a link that you send to the customer.

1. Create the link with the amount, your order reference and an expiry date. The expiry date is required, at most
   6 months ahead, in ISO 8601 with a UTC offset (or `Z`). A missing, past or too distant date is a 400 error.
2. Store `paymentLinkId` with the order and send `redirectionUrl` as returned.
3. The `paymentlink.paid` webhook tells you that a payment was processed with the link. You can also read the link
   with `GetPaymentLinkById` (status `ACTIVE`, `PAID`, `CANCELLED` or `EXPIRED`). Once paid it holds the payment ID.
   That ID has no attempt suffix: call `GetPaymentDetails` with the ID plus `_0`, then read the payment's status
   before you decide anything (mandatory rule 5).

```ruby
# Returns the link to send to the customer (email, chat, invoice).
# @param order_id [String]
# @param amount_in_cents [Integer]
# @param currency_code [String]
# @param description [String]
# @return [OnlinePayments::SDK::Domain::PaymentLinkResponse]
def create_link(order_id, amount_in_cents, currency_code, description)
  amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
  amount_of_money.amount = amount_in_cents
  amount_of_money.currency_code = currency_code

  references = OnlinePayments::SDK::Domain::OrderReferences.new
  references.merchant_reference = order_id

  order = OnlinePayments::SDK::Domain::Order.new
  order.amount_of_money = amount_of_money
  order.references = references

  link_input = OnlinePayments::SDK::Domain::PaymentLinkSpecificInput.new
  link_input.description = description
  # Required. A DateTime (not a Time), at most 6 months in the future.
  link_input.expiration_date = (Time.now + (7 * 24 * 60 * 60)).to_datetime

  request = OnlinePayments::SDK::Domain::CreatePaymentLinkRequest.new
  request.order = order
  request.payment_link_specific_input = link_input

  # CreatePaymentLink does not support idempotent requests, so no idempotence key is sent.
  link = merchant.payment_links.create_payment_link(request)
  # Store payment_link_id with the order. Send redirection_url exactly as returned.
  # The paymentlink.paid webhook (or get_payment_link_by_id) tells you when it is paid.
  # Once paid, the link's payment_id has no attempt suffix: use it with "_0" appended in
  # GetPaymentDetails, and read the payment's status.
  link
end
```

## After-payment operations

Pass an idempotence key to every capture, refund and cancel. Create it once per operation; retry rules are in `errors.md`.
Sending the same request again with the same key returns the first result and does not run the operation twice.

**Capture.** Only for payments that are authorized and not captured: status `PENDING_CAPTURE`, status category
`PENDING_MERCHANT`. A payment with authorization mode `FINAL_AUTHORIZATION` must be captured for the full amount within
7 days. One with `PRE_AUTHORIZATION` can be captured within 30 days, also for less than the authorized amount. Without
an amount, the full amount is captured and the capture is final; `isFinal` true also makes a capture final. After a
final capture no further capture is accepted, and an amount above the authorized amount is rejected. A capture that is
not final leaves the payment in `PENDING_CAPTURE`. The capture response has status `CAPTURE_REQUESTED`. The capture is
done when its operation (for a final capture, the payment) reads `CAPTURED`, which does not happen immediately: check
again later.

```ruby
# Captures an authorized payment (status PENDING_CAPTURE). Without an amount, the full amount is captured.
# @param payment_id [String]
# @param amount_in_cents [Integer]
# @param is_final [Boolean] true: this capture is final, no further capture is accepted.
# @param idempotence_key [String]
# @return [OnlinePayments::SDK::Domain::CaptureResponse]
def capture(payment_id, amount_in_cents, is_final, idempotence_key)
  details = merchant.payments.get_payment_details(payment_id)
  raise "Payment #{payment_id} cannot be captured in status #{details.status}" if details.status != 'PENDING_CAPTURE'

  request = OnlinePayments::SDK::Domain::CapturePaymentRequest.new
  request.amount = amount_in_cents
  request.is_final = is_final
  context = OnlinePayments::SDK::CallContext.new(idempotence_key)
  merchant.payments.capture_payment(payment_id, request, context)
end
```

**Refund.** Only when `statusOutput.isRefundable` is true (the payment is captured; the flag is false while the status
is `CAPTURE_REQUESTED`). Several refunds, partial or full, are allowed on one payment as long as their total does not
exceed the amount paid; a refund above the remaining amount is rejected. A refund is `REFUND_REQUESTED` while the
platform waits for the result and then becomes `REFUNDED` or `REJECTED`. Check the refund `status`; only `REFUNDED` is
done. The payment becomes `REFUNDED` only when the full amount is refunded. A partly refunded payment stays
`COMPLETED`; its operations list the refunds.

```ruby
# Refunds a captured payment, fully or partly.
# @param payment_id [String]
# @param amount_in_cents [Integer]
# @param currency_code [String]
# @param idempotence_key [String]
# @return [OnlinePayments::SDK::Domain::RefundResponse]
def refund(payment_id, amount_in_cents, currency_code, idempotence_key)
  details = merchant.payments.get_payment_details(payment_id)
  unless details.status_output&.is_refundable == true
    raise "Payment #{payment_id} is not refundable in status #{details.status}"
  end

  amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
  amount_of_money.amount = amount_in_cents
  amount_of_money.currency_code = currency_code
  request = OnlinePayments::SDK::Domain::RefundRequest.new
  request.amount_of_money = amount_of_money
  context = OnlinePayments::SDK::CallContext.new(idempotence_key)
  # REFUND_REQUESTED: the platform is processing the refund and waiting for the result. The status then becomes
  # REFUNDED or REJECTED; treat the refund as done only when it is REFUNDED.
  merchant.payments.refund_payment(payment_id, request, context)
end
```

**Cancel.** Cancels an authorization that is not captured. Only when `statusOutput.isCancellable` is true. Without an
amount, the full amount is cancelled. The acquirer decides the result, so the payment in the response is in one of
three states:

- Status `CANCELLED`, category `UNSUCCESSFUL`, status code 6: the authorization is cancelled. This is final.
- Status `CANCELLED`, category `PENDING_MERCHANT`, status code 61 or 62: the platform is waiting for the acquirer's
  answer. This is not final; the payment moves to one of the other two states.
- Status `CANCELLATION_REJECTED`, category `UNSUCCESSFUL`, status code 63: the acquirer refused the cancel. The payment
  stays authorized: do not treat it as failed. You can try the cancel again; an authorization that is not captured
  expires.

```ruby
# Cancels (voids) an authorization that is not captured yet. No amount cancels the full amount.
# @param payment_id [String]
# @param idempotence_key [String]
# @return [OnlinePayments::SDK::Domain::CancelPaymentResponse]
def cancel(payment_id, idempotence_key)
  details = merchant.payments.get_payment_details(payment_id)
  unless details.status_output&.is_cancellable == true
    raise "Payment #{payment_id} is not cancellable in status #{details.status}"
  end

  context = OnlinePayments::SDK::CallContext.new(idempotence_key)
  merchant.payments.cancel_payment(payment_id, OnlinePayments::SDK::Domain::CancelPaymentRequest.new, context)
end
```

An operation that the payment's current state does not allow (a capture after the final capture or after a cancel, a
refund before the capture or above the remaining amount, a second cancel) is answered with HTTP 400 and the error id
`ACTION_NOT_ALLOWED_ON_TRANSACTION`, without a property name. Read the payment with `GetPaymentDetails`; do not retry.

## Recurring payments

A subscription has one payment made by the customer and later charges that you start without the customer.

1. First payment: mark it as the first of a recurring series. With Hosted Checkout set
   `hostedCheckoutSpecificInput.isRecurring` to `true`; that marks the payment as the first of the series. The example
   uses Hosted Checkout and the same helpers as the Hosted Checkout flow: the return URL is built from your configured
   public base URL, and the create call uses the same retry helper. With `CreatePayment` set
   `cardPaymentMethodSpecificInput.isRecurring` to `true` and
   `cardPaymentMethodSpecificInput.recurring.recurringPaymentSequenceIndicator` to `first`.
2. When the first payment is authorised or captured (Hosted Checkout return or webhook), store its payment ID with
   the customer. The stored ID keeps working for later charges after a capture. A rejected first payment cannot be
   charged again: the subsequent payment fails with a 400 error (`ACTION_NOT_ALLOWED_ON_TRANSACTION`).

```ruby
# First payment of a subscription, made by the customer on the Hosted Checkout Page.
# The recurring flag marks it as the first payment of the series.
# It follows the Hosted Checkout flow: the return URL is built from your configuration and the call goes through
# the same retry helper. Handle the return as there.
# @param order_id [String]
# @param amount_in_cents [Integer]
# @param currency_code [String]
# @return [String] the URL to redirect the customer to
def start_subscription(order_id, amount_in_cents, currency_code)
  amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
  amount_of_money.amount = amount_in_cents
  amount_of_money.currency_code = currency_code

  references = OnlinePayments::SDK::Domain::OrderReferences.new
  references.merchant_reference = order_id

  order = OnlinePayments::SDK::Domain::Order.new
  order.amount_of_money = amount_of_money
  order.references = references

  checkout_input = OnlinePayments::SDK::Domain::HostedCheckoutSpecificInput.new
  # The return URL is built from your configured public base URL, as in the Hosted Checkout flow.
  checkout_input.return_url = hosted_checkout.build_return_url(order_id)
  checkout_input.is_recurring = true

  request = OnlinePayments::SDK::Domain::CreateHostedCheckoutRequest.new
  request.order = order
  request.hosted_checkout_specific_input = checkout_input

  response = hosted_checkout.create_hosted_checkout_with_retry(request)
  hosted_checkout_id = response.hosted_checkout_id
  returnmac = response.returnmac
  redirect_url = response.redirect_url
  if hosted_checkout_id.nil? || returnmac.nil? || redirect_url.nil?
    raise "Incomplete hosted checkout response for order #{order_id}"
  end

  orders.save_hosted_checkout(order_id, hosted_checkout_id, returnmac)
  redirect_url
end

# When the first payment is authorised or captured, keep its payment ID: later charges refer to it.
# @param customer_id [String]
# @param first_payment_id [String]
# @return [void]
def on_first_payment_succeeded(customer_id, first_payment_id)
  orders.save_recurring_payment_id(customer_id, first_payment_id)
end
```

3. Later charges: call the subsequent payment operation on the first payment's ID with `subsequentType`
   `Recurring` (fixed amount, regular intervals of at most one year, started by you). The allowed values are
   `Recurring`, `Unscheduled`, `Installment`, `NoShow`, `DelayedCharge`, `PartialShipment`, `Resubmission`,
   `RecurringVariable` and `UnscheduledFixed`; any other value is a 400 error on `subsequentType`. The new payment is
   in the response (`payment`). A declined charge is reported like a declined `CreatePayment` (see `errors.md`).
   Create one idempotence key per charge and store it with the charge before the first call; retry rules are in
   `errors.md`.

```ruby
# Later charge started by you, without the customer (merchant-initiated).
# The caller creates ONE idempotence key per charge and stores it with the charge (orders.save_idempotence_key)
# before the first call. Retries of the same charge reuse that key; the rules are in the error handling example.
# @param customer_id [String]
# @param order_id [String]
# @param amount_in_cents [Integer]
# @param currency_code [String]
# @param idempotence_key [String]
# @return [Symbol] one of the OrderPaymentState values
def charge_renewal(customer_id, order_id, amount_in_cents, currency_code, idempotence_key)
  first_payment_id = orders.get_recurring_payment_id(customer_id)

  amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
  amount_of_money.amount = amount_in_cents
  amount_of_money.currency_code = currency_code

  references = OnlinePayments::SDK::Domain::OrderReferences.new
  references.merchant_reference = order_id

  order = OnlinePayments::SDK::Domain::Order.new
  order.amount_of_money = amount_of_money
  order.references = references

  card_input = OnlinePayments::SDK::Domain::SubsequentCardPaymentMethodSpecificInput.new
  # Recurring = fixed amount, regular intervals (at most one year), started by you.
  # Other allowed values: Unscheduled, Installment, NoShow, DelayedCharge, PartialShipment,
  # Resubmission, RecurringVariable, UnscheduledFixed.
  card_input.subsequent_type = 'Recurring'
  # SALE: authorised and captured at once. Acquirers that do not support it ignore it.
  card_input.authorization_mode = 'SALE'

  request = OnlinePayments::SDK::Domain::SubsequentPaymentRequest.new
  request.order = order
  request.subsequentcard_payment_method_specific_input = card_input

  context = OnlinePayments::SDK::CallContext.new(idempotence_key)
  # A declined charge raises DeclinedPaymentException, as for create_payment.
  response = merchant.subsequent.subsequent_payment(first_payment_id, request, context)
  payment = response.payment
  payment_id = payment&.id
  raise "The subsequent payment response for order #{order_id} has no payment" if payment.nil? || payment_id.nil?

  orders.save_payment_id(order_id, payment_id)
  state = PaymentStatusExample.to_order_state(payment.status, payment.status_output)
  orders.save_state(order_id, state)
  state
end
```

For one-click payments with a stored card (the customer is present), see the card-on-file guide:
https://docs.direct.worldline-solutions.com/en/payment-methods-and-features/advanced-features/card-on-file/api-endpoints-and-jsons-samples

## Payment status

Read the status with `GetPaymentDetails` after a redirect back to your site, after a webhook, after a
declined-payment error, after a capture or a refund, and whenever you are unsure. `GetHostedCheckout` keeps showing
the payment as captured after a refund.

`statusOutput.statusCategory` decides the order state:

| statusCategory | Meaning | What to do |
|---|---|---|
| `COMPLETED` | Paid (captured or sale). A partly refunded payment stays `COMPLETED`. | Fulfil the order. |
| `PENDING_MERCHANT` | Authorized and waiting for a capture (status `PENDING_CAPTURE`), or a cancelled payment waiting for its final result (status `CANCELLED`). | `PENDING_CAPTURE`: capture or cancel. `CANCELLED`: wait for a webhook or check again later. |
| `PENDING_PAYMENT`, `PENDING_CONNECT_OR_3RD_PARTY`, `CREATED` | Not final: waiting for the result of 3-D Secure, an authorization, a capture (`CAPTURE_REQUESTED`) or a refund (`REFUND_REQUESTED`). | Wait for a webhook or check again later. |
| `UNSUCCESSFUL` | Declined, cancelled or failed (`status` tells which). | Do not fulfil. |
| `REFUNDED` | Fully refunded. | Update the order. |
| `REVERSED` | Reversed. | Do not treat as paid; check the payment's operations and follow up. |

`status` (`CREATED`, `CANCELLED`, `REJECTED`, `REJECTED_CAPTURE`, `REDIRECTED`, `PENDING_PAYMENT`, `PENDING_COMPLETION`,
`PENDING_CAPTURE`, `AUTHORIZATION_REQUESTED`, `CAPTURE_REQUESTED`, `CAPTURED`, `REVERSED`, `REFUND_REQUESTED`,
`REFUNDED`) and `statusCode` give more detail. `isCancellable` and `isRefundable` say whether a cancel or a refund is
possible; `isAuthorized` says that the transaction was authorized.
`statusOutput` can be missing in a response. Treat a missing `statusOutput` or `statusCategory` as not final
(pending), never as paid.
Status reference: https://docs.direct.worldline-solutions.com/en/integration/api-developer-guide/statuses

```ruby
# @param order_id [String]
# @return [Symbol] one of the OrderPaymentState values
def refresh_payment_state(order_id)
  payment_id = orders.get_payment_id(order_id)
  # No payment ID stored yet: the webhook or your reconciliation job will settle the order.
  return OrderPaymentState::PENDING if payment_id.nil?

  details = merchant.payments.get_payment_details(payment_id)
  state = PaymentStatusExample.to_order_state(details.status, details.status_output)
  orders.save_state(order_id, state)
  state
end

# Decide on status_category. status and status_code give more detail.
# status_output or status_category can be missing in a response: that is pending, never paid.
# @param status [String, nil]
# @param status_output [OnlinePayments::SDK::Domain::PaymentStatusOutput, nil]
# @return [Symbol] one of the OrderPaymentState values
def self.to_order_state(status, status_output)
  case status_output&.status_category
  when 'COMPLETED'
    OrderPaymentState::PAID
  when 'PENDING_MERCHANT'
    # PENDING_CAPTURE: authorized but not captured yet, capture or cancel it.
    # Any other status (CANCELLED, waiting for its final result) is not final.
    status == 'PENDING_CAPTURE' ? OrderPaymentState::AUTHORIZED : OrderPaymentState::PENDING
  when 'REFUNDED'
    OrderPaymentState::REFUNDED
  when 'REVERSED'
    # Not paid: do not treat the order as paid.
    OrderPaymentState::REVERSED
  when 'UNSUCCESSFUL'
    status == 'CANCELLED' ? OrderPaymentState::CANCELLED : OrderPaymentState::FAILED
  else
    # CREATED, PENDING_PAYMENT, PENDING_CONNECT_OR_3RD_PARTY: not final.
    # A missing status_output or status_category (nil) and categories added later also end up here: not paid.
    # Wait for a webhook or check again later.
    OrderPaymentState::PENDING
  end
end
```
