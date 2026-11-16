# AGENTS.md

## Using this SDK in your project

If you are writing code that integrates Online Payments with this SDK, read the agent skill
for this SDK version first and use the code it shows. Do not write SDK calls from memory.

- In this gem: `skills/online-payments/SKILL.md`
  (gem folder: `bundle info onlinepayments-sdk-ruby --path`)
- Online: https://raw.githubusercontent.com/Online-Payments/sdk-ruby/11.1.0/skills/online-payments/SKILL.md

The skill matches SDK version 11.1.0. If your installed version is different, use the skill
from your installed gem.

## Working on this SDK

- SDK source: `lib/onlinepayments/sdk/`; unit tests: `spec/lib/`; integration tests: `spec/integration/`.
- Install the test dependencies with `gem install rake rspec webmock sinatra`.
- Run the unit tests with `rake unit`, the integration tests with `rake integration`, and both with `rake spec`.
- The integration tests need the environment variables `onlinePayments_api_v1hmac_apiKeyId`,
  `onlinePayments_api_v1hmac_secretApiKey` and `onlinePayments_api_merchantId`.
- Generate the documentation with `rake yard` (output in `doc/`).
- See `README.md` for details.
