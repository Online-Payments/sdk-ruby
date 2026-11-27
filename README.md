# Online Payments Ruby SDK

## Introduction

The Ruby SDK helps you to communicate with the payment platform server API. Its primary features are:

* convenient Ruby library for the API calls and responses
    * marshalls Ruby request objects to HTTP requests
    * unmarshalls HTTP responses to Ruby response objects or Ruby exceptions
* handling of all the details concerning authentication
* handling of required metadata

See the [Online Payments Developer Hub](https://docs.direct.worldline-solutions.com/documentation/sdk/server/ruby/) for more information on how to use the SDK.

## Structure of this repository

This repository consists out of three main components:

1. The source code of the SDK itself: `/lib/onlinepayments/sdk/`
2. The source code of the SDK unit tests: `/spec/lib/`
3. The source code of the SDK integration tests: `/spec/integration/`

Note that the source code of the unit tests and integration tests can only be found on GitHub.

## Requirements

Ruby 3.4 or higher is required. In addition, the following packages are required:

* [net-http-persistent](https://github.com/drbrain/net-http-persistent) 4.0 or higher
* [concurrent-ruby](https://github.com/ruby-concurrency/concurrent-ruby) 1.3 or higher
* [base64](https://github.com/ruby/base64) 0.2 or higher

These packages will be installed automatically if the SDK is installed following the below instructions.

## Installation

### Using Bundler

Add the SDK to the `Gemfile` of your project:

    gem 'onlinepayments-sdk-ruby'

Then execute the following command:

    bundle install

### Using RubyGems

To install the SDK using `gem`, execute the following command:

    gem install onlinepayments-sdk-ruby

### Using a pre-built gem

1. Download the latest version of the Ruby SDK from GitHub. Choose the `onlinepayments-sdk-ruby-x.y.z.gem` file from the [releases](https://github.com/Online-Payments/sdk-ruby/releases) page, where `x.y.z` is the version number.
2. Navigate into the folder where the gem file is downloaded to, and execute the following command:

   ```
   gem install onlinepayments-sdk-ruby-x.y.z.gem
   ```

3. Feel free to delete the gem file at this point, it is no longer required.

### From source

1. Download the latest version of the Ruby SDK from GitHub. Choose the `onlinepayments-sdk-ruby-x.y.z.zip` file from the [releases](https://github.com/Online-Payments/sdk-ruby/releases) page, where `x.y.z` is the version number.
2. Unzip the file, navigate into the folder where the file is unzipped to, and execute the following commands:

   ```
   gem build onlinepayments-sdk-ruby.gemspec
   gem install onlinepayments-sdk-ruby-x.y.z.gem
   ```

3. Feel free to delete the unzipped archive, the zip file, and the gem file at this point; they are no longer required.

## Working with AI agents

The SDK comes with an agent skill for AI coding agents such as Claude Code, Codex, GitHub Copilot and Cursor. It tells the agent how to choose an integration method, which steps each flow needs, which rules every integration must follow, and gives code examples that are type-checked against this SDK version.

The skill for this version is available:

* online, as plain Markdown for agents: https://raw.githubusercontent.com/Online-Payments/sdk-ruby/12.0.0/skills/online-payments/SKILL.md
* online, on GitHub: https://github.com/Online-Payments/sdk-ruby/blob/12.0.0/skills/online-payments/SKILL.md
* in the installed gem: `skills/online-payments/` in the gem folder, e.g. `vendor/bundle/ruby/<ruby version>/gems/onlinepayments-sdk-ruby-<version>/skills/online-payments/` when Bundler installs into `vendor/bundle`. `bundle info onlinepayments-sdk-ruby --path` prints the gem folder; without Bundler, `gem contents onlinepayments-sdk-ruby | grep SKILL.md` prints the path of the skill.
* in this repository: `skills/online-payments/`

To make your agent use it, add this to the `AGENTS.md` or `CLAUDE.md` file of your project:

```
For the Online Payments integration (onlinepayments-sdk-ruby), read and follow the agent skill
skills/online-payments/SKILL.md in the folder of the installed onlinepayments-sdk-ruby gem (bundle info onlinepayments-sdk-ruby --path)
(online: https://raw.githubusercontent.com/Online-Payments/sdk-ruby/12.0.0/skills/online-payments/SKILL.md)
Use the code shown in the skill; do not write SDK calls from memory.
```

Agents that support the Agent Skills format can also load the folder directly, for example by copying `skills/online-payments/` from the gem folder to `.claude/skills/online-payments/` in your project for Claude Code.

## Uninstalling

After the Ruby SDK has been installed, it can be uninstalled using the
following command:

    gem uninstall onlinepayments-sdk-ruby

The required packages can be uninstalled in the same way.

## Usage

After the Ruby SDK has been installed, it can be required in a Ruby program as follows:

```ruby
require 'onlinepayments/sdk'
```

### Creating a client

A client can be created from code, from environment variables or from a YAML file:

```ruby
client = OnlinePayments::SDK::Factory.create_client(
  api_endpoint: 'https://payment.direct.ecom.preprod.worldline-solutions.com',
  api_key_id: '...',
  secret_api_key: '...',
  integrator: 'MyShop',
  connect_timeout: 10,    # seconds
  socket_timeout: 60      # seconds
  # optional: max_connections, proxy_configuration, shopping_cart_extension
)

client = OnlinePayments::SDK::Factory.create_client_from_env

client = OnlinePayments::SDK::Factory.create_client_from_file('configuration.yml', 'api_key_id', 'secret_api_key')
```

`Factory.create_client_from_env` reads the following environment variables:

| Environment variable | Description |
|---|---|
| `ONLINEPAYMENTS_API_ENDPOINT` | Required. The API endpoint, for example `https://payment.direct.ecom.preprod.worldline-solutions.com` |
| `ONLINEPAYMENTS_API_KEY_ID` | Required. The API key id |
| `ONLINEPAYMENTS_SECRET_API_KEY` | Required. The secret API key |
| `ONLINEPAYMENTS_INTEGRATOR` | Required. The name of the integrator |
| `ONLINEPAYMENTS_CONNECT_TIMEOUT` | Required. The connect timeout in seconds |
| `ONLINEPAYMENTS_SOCKET_TIMEOUT` | Required. The socket timeout in seconds |

The merchant ID is not part of the client configuration; pass it to `client.merchant(merchant_id)`.

When a block is given, the client is passed to the block and closed at the end of the block.
Without a block, close the client with `client.close` when it is no longer needed.

```ruby
OnlinePayments::SDK::Factory.create_client_from_env do |client|
  # use client as needed
end
```

### Creating requests

Domain objects accept their fields as keyword arguments:

```ruby
Domain = OnlinePayments::SDK::Domain

request = Domain::CreatePaymentRequest.new(
  order: Domain::Order.new(amount_of_money: Domain::AmountOfMoney.new(amount: 125000, currency_code: 'EUR'))
)
response = client.merchant(merchant_id).payments.create_payment(request, OnlinePayments::SDK::CallContext.new('order-42'))
```

Fields can also be set afterwards, with setters (`request.order = ...`) or with the fluent `with_*` methods
(`Domain::AmountOfMoney.new.with_amount(125000).with_currency_code('EUR')`).
An unknown keyword argument raises an `ArgumentError`.
Printing a domain object (`p`, `inspect`, `to_s`) shows its fields, with card numbers, CVVs and personal data masked.

### Handling errors

```ruby
begin
  client.merchant(merchant_id).payments.create_payment(request, OnlinePayments::SDK::CallContext.new(idempotence_key))
rescue OnlinePayments::SDK::DeclinedPaymentException => e
  # e.payment_result contains the declined payment
rescue OnlinePayments::SDK::ApiException => e
  logger.error("Payment failed: #{e.message}")    # the response body in the message is masked
  # e.cause.headers contains the response headers
rescue OnlinePayments::SDK::Communication::CommunicationException => e
  # e.cause contains the original error
end
```

A timeout, a `CommunicationException` or a `PlatformException` during `create_payment` means the outcome of the payment is unknown.
Check the payment status with `get_payment`, and always send an idempotence key so that a retry does not create a second payment.

The unmasked response body is available in `response_body`.

## Running tests

There are two types of tests: unit tests and integration tests. The unit tests will work out-of-the-box; for the integration tests some configuration is required.
First, some environment variables need to be set:
* `ONLINEPAYMENTS_API_KEY_ID` for the API key id to use.
* `ONLINEPAYMENTS_SECRET_API_KEY` for the secret API key to use.
* `ONLINEPAYMENTS_MERCHANT_ID` for your merchant ID.
* Optionally, `ONLINEPAYMENTS_API_ENDPOINT` to use a different endpoint than `https://payment.direct.ecom.preprod.worldline-solutions.com`.

If any of the required variables is missing, the integration tests are skipped.

The file `.env.example` lists all variables. You can copy it to `.env` (which is ignored by git) and fill in your values.
The integration tests load `.env` automatically; variables that are already set in the environment take precedence.

To install the test dependencies, execute the following command from the root of the repository:

    bundle install

The following commands can then be executed from the root of the repository to execute the tests:

* Unit tests:

    ```
    bundle exec rake unit
    ```

* Integration tests:

    ```
    bundle exec rake integration
    ```

* Both unit and integration tests:

    ```
    bundle exec rake spec
    ```

The code style of the hand-written code can be checked with the following command:

    bundle exec rake rubocop

## Generating documentation

Documentation can be generated with YARD. To install the required dependencies, execute the following command from the root of the repository:

    bundle install

Once the dependencies are installed, documentation can be generated with the following command (ran from the root folder):

    bundle exec rake yard

Documentation will be generated in the `/doc` folder. The file `/doc/index.html` is the main documentation file.
